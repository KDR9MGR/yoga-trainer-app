import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trainer_manager_pro/features/live_sessions/presentation/pages/live_sessions_list_page.dart';

class ClassCardWidget extends ConsumerWidget {
  final Map<String, dynamic> classData;

  const ClassCardWidget({
    super.key,
    required this.classData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startTime = DateTime.parse(classData['start_time']);
    final endTime = DateTime.parse(classData['end_time']);
    final isUpcoming = startTime.isAfter(DateTime.now());

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
                    classData['title'],
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isUpcoming)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Upcoming',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              classData['description'] ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${DateFormat('MMM dd • h:mm a').format(startTime)} - ${DateFormat('h:mm a').format(endTime)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    classData['location'] ?? 'Online',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                if (isUpcoming) ...[
                  ElevatedButton.icon(
                    onPressed: () => _navigateToLiveSessions(context),
                    icon: const Icon(Icons.video_call),
                    label: const Text('Live Session'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                OutlinedButton.icon(
                  onPressed: () => _viewClassDetails(context),
                  icon: const Icon(Icons.info_outline),
                  label: const Text('Details'),
                ),
                const Spacer(),
                Text(
                  '${classData['enrolled_count'] ?? 0} enrolled',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLiveSessions(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LiveSessionsListPage(),
      ),
    );
  }

  void _viewClassDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(classData['title']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${classData['description'] ?? 'N/A'}'),
            const SizedBox(height: 8),
            Text('Location: ${classData['location'] ?? 'Online'}'),
            const SizedBox(height: 8),
            Text('Duration: ${classData['duration'] ?? 60} minutes'),
            const SizedBox(height: 8),
            Text('Max Capacity: ${classData['max_participants'] ?? 'Unlimited'}'),
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
} 