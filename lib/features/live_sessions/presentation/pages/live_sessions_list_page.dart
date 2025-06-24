import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/features/live_sessions/presentation/controllers/live_session_controller.dart';
import 'package:trainer_manager_pro/features/live_sessions/presentation/pages/create_live_session_page.dart';
import 'package:trainer_manager_pro/features/live_sessions/presentation/pages/live_session_page.dart';

class LiveSessionsListPage extends ConsumerStatefulWidget {
  const LiveSessionsListPage({super.key});

  @override
  ConsumerState<LiveSessionsListPage> createState() => _LiveSessionsListPageState();
}

class _LiveSessionsListPageState extends ConsumerState<LiveSessionsListPage> {
  final _supabase = Supabase.instance.client;
  String? _trainerId;

  @override
  void initState() {
    super.initState();
    _loadTrainerId();
  }

  Future<void> _loadTrainerId() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      final trainerResponse = await _supabase
          .from('trainers')
          .select('id')
          .eq('user_id', user.id)
          .maybeSingle();
      
      if (trainerResponse != null) {
        setState(() {
          _trainerId = trainerResponse['id'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_trainerId == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Sessions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToCreateSession(),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer(
      builder: (context, ref, child) {
        final liveSessionsAsync = ref.watch(trainerLiveSessionsProvider(_trainerId!));
        
        return liveSessionsAsync.when(
          data: (sessions) => _buildSessionsList(sessions),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => _buildErrorState(error.toString()),
        );
      },
    );
  }

  Widget _buildSessionsList(List<Map<String, dynamic>> sessions) {
    if (sessions.isEmpty) {
      return _buildEmptyState();
    }

    // Group sessions by status
    final scheduledSessions = sessions.where((s) => s['status'] == 'scheduled').toList();
    final completedSessions = sessions.where((s) => s['status'] == 'completed').toList();

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(trainerLiveSessionsProvider(_trainerId!));
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (scheduledSessions.isNotEmpty) ...[
              _buildSectionHeader('Scheduled Sessions', scheduledSessions.length),
              const SizedBox(height: 16),
              ...scheduledSessions.map((session) => _buildSessionCard(session, true)),
              const SizedBox(height: 24),
            ],
            if (completedSessions.isNotEmpty) ...[
              _buildSectionHeader('Completed Sessions', completedSessions.length),
              const SizedBox(height: 16),
              ...completedSessions.map((session) => _buildSessionCard(session, false)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, int count) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            count.toString(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSessionCard(Map<String, dynamic> session, bool isScheduled) {
    final scheduledTime = DateTime.parse(session['scheduled_time']);
    final isUpcoming = scheduledTime.isAfter(DateTime.now());
    final canJoin = isScheduled && isUpcoming;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    session['title'],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildStatusChip(session['status']),
              ],
            ),
            const SizedBox(height: 8),
            if (session['classes'] != null)
              Text(
                'Class: ${session['classes']['title']}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  DateFormat('MMM dd, yyyy • h:mm a').format(scheduledTime),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.timer, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${session['duration_minutes']} min',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                if (canJoin) ...[
                  ElevatedButton.icon(
                    onPressed: () => _joinSession(session),
                    icon: const Icon(Icons.video_call),
                    label: const Text('Start Session'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                OutlinedButton.icon(
                  onPressed: () => _showSessionDetails(session),
                  icon: const Icon(Icons.info_outline),
                  label: const Text('Details'),
                ),
                const Spacer(),
                if (isScheduled)
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleMenuAction(value, session),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'cancel',
                        child: Row(
                          children: [
                            Icon(Icons.cancel, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Cancel', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    String label;
    
    switch (status) {
      case 'scheduled':
        color = Colors.blue;
        label = 'Scheduled';
        break;
      case 'live':
        color = Colors.green;
        label = 'Live';
        break;
      case 'completed':
        color = Colors.grey;
        label = 'Completed';
        break;
      default:
        color = Colors.grey;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.video_call_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No Live Sessions Yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Schedule your first live session to connect with your students',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _navigateToCreateSession,
            icon: const Icon(Icons.add),
            label: const Text('Schedule Session'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Error Loading Sessions',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.red[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              ref.invalidate(trainerLiveSessionsProvider(_trainerId!));
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _navigateToCreateSession() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateLiveSessionPage(),
      ),
    );
  }

  void _joinSession(Map<String, dynamic> session) async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) return;

      final sessionData = await ref.read(liveSessionControllerProvider.notifier).joinLiveSession(
        sessionId: session['id'],
        userId: user.id,
        userName: user.userMetadata?['full_name'] ?? 'Trainer',
      );

      if (sessionData != null && mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LiveSessionPage(
              conferenceID: session['zego_room_id'],
              userId: user.id,
              userName: user.userMetadata?['full_name'] ?? 'Trainer',
              sessionTitle: session['title'],
              isHost: true,
              onLeave: () {
                // Optionally end the session when host leaves
                ref.read(liveSessionControllerProvider.notifier).endLiveSession(session['id']);
              },
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error joining session: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showSessionDetails(Map<String, dynamic> session) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(session['title']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Class: ${session['classes']?['title'] ?? 'N/A'}'),
            const SizedBox(height: 8),
            Text('Duration: ${session['duration_minutes']} minutes'),
            const SizedBox(height: 8),
            Text('Status: ${session['status']}'),
            const SizedBox(height: 8),
            Text('Scheduled: ${DateFormat('MMM dd, yyyy • h:mm a').format(DateTime.parse(session['scheduled_time']))}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _handleMenuAction(String action, Map<String, dynamic> session) {
    switch (action) {
      case 'edit':
        // TODO: Implement edit functionality
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit functionality coming soon!')),
        );
        break;
      case 'cancel':
        _showCancelConfirmation(session);
        break;
    }
  }

  void _showCancelConfirmation(Map<String, dynamic> session) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Session'),
        content: Text('Are you sure you want to cancel "${session['title']}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _cancelSession(session);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Cancel Session'),
          ),
        ],
      ),
    );
  }

  void _cancelSession(Map<String, dynamic> session) async {
    try {
      await ref.read(liveSessionControllerProvider.notifier).endLiveSession(session['id']);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Session cancelled successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error cancelling session: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
} 