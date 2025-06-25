import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/shared/presentation/widgets/app_bottom_navigation.dart';

class StudentsPage extends ConsumerStatefulWidget {
  const StudentsPage({super.key});

  @override
  ConsumerState<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends ConsumerState<StudentsPage> {
  final _supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _allStudents = [];
  List<Map<String, dynamic>> _enrolledStudents = [];
  bool _isLoading = true;
  String _searchQuery = '';
  String _selectedFilter = 'all';
  bool _showAllStudents = true;

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    try {
      setState(() => _isLoading = true);
      
      final user = _supabase.auth.currentUser;
      if (user == null) return;

      // Get trainer ID
      final trainerResponse = await _supabase
          .from('trainers')
          .select('id')
          .eq('user_id', user.id)
          .single();

      final trainerId = trainerResponse['id'];

      // Load all students
      final allStudentsResponse = await _supabase
          .from('students')
          .select('*')
          .order('created_at', ascending: false);

      // Load enrolled students in this trainer's classes
      final enrolledResponse = await _supabase
          .from('enrollments')
          .select('''
            *,
            students!inner(
              id,
              user_id,
              email,
              full_name,
              profile_image_url,
              phone_number,
              age,
              fitness_goal,
              created_at
            ),
            classes!inner(
              id,
              title,
              type,
              level,
              start_time,
              price
            )
          ''')
          .eq('classes.trainer_id', trainerId)
          .order('enrolled_at', ascending: false);

      // Process enrolled students
      final Map<String, Map<String, dynamic>> uniqueEnrolledStudents = {};
      for (final enrollment in enrolledResponse) {
        final studentId = enrollment['students']['id'];
        if (!uniqueEnrolledStudents.containsKey(studentId)) {
          uniqueEnrolledStudents[studentId] = {
            ...enrollment['students'],
            'enrollments': [],
            'total_classes': 0,
            'total_spent': 0.0,
            'last_enrollment': enrollment['enrolled_at'],
            'is_enrolled': true,
          };
        }
        
        uniqueEnrolledStudents[studentId]!['enrollments'].add(enrollment);
        uniqueEnrolledStudents[studentId]!['total_classes']++;
        uniqueEnrolledStudents[studentId]!['total_spent'] += 
            (enrollment['classes']['price'] ?? 0.0);
      }

      // Process all students and mark enrollment status
      final processedAllStudents = allStudentsResponse.map((student) {
        final studentId = student['id'];
        if (uniqueEnrolledStudents.containsKey(studentId)) {
          return uniqueEnrolledStudents[studentId]!;
        } else {
          return {
            ...student,
            'enrollments': [],
            'total_classes': 0,
            'total_spent': 0.0,
            'last_enrollment': null,
            'is_enrolled': false,
          };
        }
      }).toList();

      setState(() {
        _allStudents = processedAllStudents;
        _enrolledStudents = uniqueEnrolledStudents.values.toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading students: $e')),
        );
      }
    }
  }

  List<Map<String, dynamic>> get _filteredStudents {
    var filtered = _showAllStudents ? _allStudents : _enrolledStudents;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((student) {
        final name = student['full_name']?.toString().toLowerCase() ?? '';
        final email = student['email']?.toString().toLowerCase() ?? '';
        final query = _searchQuery.toLowerCase();
        return name.contains(query) || email.contains(query);
      }).toList();
    }

    // Apply enrollment filter
    if (_selectedFilter != 'all') {
      if (_selectedFilter == 'enrolled') {
        filtered = filtered.where((student) => student['is_enrolled'] == true).toList();
      } else if (_selectedFilter == 'not_enrolled') {
        filtered = filtered.where((student) => student['is_enrolled'] == false).toList();
      } else if (_selectedFilter == 'recent') {
        filtered = filtered.where((student) {
          if (student['last_enrollment'] == null) return false;
          final lastEnrollment = DateTime.parse(student['last_enrollment']);
          return DateTime.now().difference(lastEnrollment).inDays <= 30;
        }).toList();
      }
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_showAllStudents ? 'All Students' : 'Enrolled Students'),
        actions: [
          IconButton(
            icon: Icon(_showAllStudents ? Icons.group : Icons.school),
            onPressed: () {
              setState(() {
                _showAllStudents = !_showAllStudents;
              });
            },
            tooltip: _showAllStudents ? 'Show Enrolled Only' : 'Show All Students',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchAndFilter(),
          _buildStudentStats(),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: _loadStudents,
                    child: _filteredStudents.isEmpty
                        ? _buildEmptyState()
                        : _buildStudentsList(),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }

  Widget _buildStudentStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              'Total Students',
              _allStudents.length.toString(),
              Icons.people,
              Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Enrolled',
              _enrolledStudents.length.toString(),
              Icons.school,
              Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Not Enrolled',
              (_allStudents.length - _enrolledStudents.length).toString(),
              Icons.person_add,
              Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          TextField(
            onChanged: (value) => setState(() => _searchQuery = value),
            decoration: InputDecoration(
              hintText: 'Search students...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('All', 'all'),
                const SizedBox(width: 8),
                _buildFilterChip('Enrolled', 'enrolled'),
                const SizedBox(width: 8),
                _buildFilterChip('Not Enrolled', 'not_enrolled'),
                const SizedBox(width: 8),
                _buildFilterChip('Recent', 'recent'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _selectedFilter == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) => setState(() => _selectedFilter = value),
      backgroundColor: Theme.of(context).cardColor,
      selectedColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
      checkmarkColor: Theme.of(context).primaryColor,
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 24),
          Text(
            'No Students Found',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _searchQuery.isNotEmpty
                ? 'Try adjusting your search terms'
                : 'Students will appear here when they enroll in your classes',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStudentsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _filteredStudents.length,
      itemBuilder: (context, index) {
        final student = _filteredStudents[index];
        return _buildStudentCard(student);
      },
    );
  }

  Widget _buildStudentCard(Map<String, dynamic> student) {
    final isEnrolled = student['is_enrolled'] ?? false;
    final totalClasses = student['total_classes'] ?? 0;
    final totalSpent = student['total_spent'] ?? 0.0;
    final hasLastEnrollment = student['last_enrollment'] != null;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      backgroundImage: student['profile_image_url'] != null
                          ? NetworkImage(student['profile_image_url'])
                          : null,
                      child: student['profile_image_url'] == null
                          ? Icon(
                              Icons.person,
                              color: Theme.of(context).primaryColor,
                              size: 30,
                            )
                          : null,
                    ),
                    if (isEnrolled)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              student['full_name'] ?? 'Unknown Student',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isEnrolled ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isEnrolled ? Colors.green.withValues(alpha: 0.3) : Colors.orange.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Text(
                              isEnrolled ? 'Enrolled' : 'Not Enrolled',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: isEnrolled ? Colors.green : Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        student['email'] ?? '',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      if (student['phone_number'] != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          student['phone_number'],
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'view',
                      child: Row(
                        children: [
                          Icon(Icons.visibility),
                          SizedBox(width: 8),
                          Text('View Details'),
                        ],
                      ),
                    ),
                    if (!isEnrolled)
                      const PopupMenuItem(
                        value: 'enroll',
                        child: Row(
                          children: [
                            Icon(Icons.add_circle),
                            SizedBox(width: 8),
                            Text('Enroll in Class'),
                          ],
                        ),
                      ),
                    const PopupMenuItem(
                      value: 'contact',
                      child: Row(
                        children: [
                          Icon(Icons.message),
                          SizedBox(width: 8),
                          Text('Contact'),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 'view') {
                      _showStudentDetails(student);
                    } else if (value == 'enroll') {
                      _showEnrollmentDialog(student);
                    } else if (value == 'contact') {
                      _showContactOptions(student);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatItem(
                      'Classes',
                      totalClasses.toString(),
                      Icons.fitness_center,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey[300],
                  ),
                  Expanded(
                    child: _buildStatItem(
                      'Spent',
                      '\$${totalSpent.toStringAsFixed(0)}',
                      Icons.attach_money,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey[300],
                  ),
                  Expanded(
                    child: _buildStatItem(
                      'Last Enrolled',
                      hasLastEnrollment 
                        ? DateFormat('MMM dd').format(DateTime.parse(student['last_enrollment']))
                        : 'Never',
                      Icons.schedule,
                    ),
                  ),
                ],
              ),
            ),
            if (student['fitness_goal'] != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Goal: ${student['fitness_goal']}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey[600],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  void _showStudentDetails(Map<String, dynamic> student) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      backgroundImage: student['profile_image_url'] != null
                          ? NetworkImage(student['profile_image_url'])
                          : null,
                      child: student['profile_image_url'] == null
                          ? Icon(
                              Icons.person,
                              color: Theme.of(context).primaryColor,
                              size: 35,
                            )
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student['full_name'] ?? 'Unknown Student',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            student['email'] ?? '',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Enrollment History',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: student['enrollments'].length,
                    itemBuilder: (context, index) {
                      final enrollment = student['enrollments'][index];
                      final enrolledAt = DateTime.parse(enrollment['enrolled_at']);
                      
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              enrollment['classes']['title'] ?? 'Unknown Class',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '${enrollment['classes']['type']} • ${enrollment['classes']['level']}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const Spacer(),
                                Text(
                                  '\$${enrollment['classes']['price'] ?? '0'}',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Enrolled: ${DateFormat('MMM dd, yyyy').format(enrolledAt)}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showContactOptions(Map<String, dynamic> student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Contact ${student['full_name']}'),
        content: const Text('Contact options will be available in a future update.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showEnrollmentDialog(Map<String, dynamic> student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enroll ${student['full_name']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select a class to enroll this student:'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.blue, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Enrollment functionality will be available soon!',
                      style: TextStyle(color: Colors.blue, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Implement enrollment logic
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Enrollment feature coming soon!'),
                  backgroundColor: Colors.blue,
                ),
              );
            },
            child: const Text('Coming Soon'),
          ),
        ],
      ),
    );
  }
} 