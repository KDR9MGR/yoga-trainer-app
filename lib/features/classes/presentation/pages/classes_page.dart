import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/shared/presentation/widgets/app_bottom_navigation.dart';

class ClassesPage extends ConsumerStatefulWidget {
  const ClassesPage({super.key});

  @override
  ConsumerState<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends ConsumerState<ClassesPage> {
  final _supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _classes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadClasses();
  }

  Future<void> _loadClasses() async {
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

      // Load classes for this trainer
      final response = await _supabase
          .from('classes')
          .select('''
            *,
            enrollments!inner(count)
          ''')
          .eq('trainer_id', trainerId)
          .order('created_at', ascending: false);

      setState(() {
        _classes = List<Map<String, dynamic>>.from(response);
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading classes: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Classes'),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadClasses,
              child: _classes.isEmpty
                  ? _buildEmptyState()
                  : _buildClassesList(),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateClassDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Create Class'),
      ),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.fitness_center,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 24),
          Text(
            'No Classes Yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first yoga class to get started',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => _showCreateClassDialog(),
            icon: const Icon(Icons.add),
            label: const Text('Create First Class'),
          ),
        ],
      ),
    );
  }

  Widget _buildClassesList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _classes.length,
      itemBuilder: (context, index) {
        final classData = _classes[index];
        return _buildClassCard(classData);
      },
    );
  }

  Widget _buildClassCard(Map<String, dynamic> classData) {
    final startTime = DateTime.parse(classData['start_time']);
    final endTime = DateTime.parse(classData['end_time']);
    final status = classData['status'] ?? 'scheduled';
    final currentParticipants = classData['current_participants'] ?? 0;
    final maxParticipants = classData['max_participants'] ?? 0;

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
                    classData['title'] ?? 'Unnamed Class',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildStatusChip(status),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              classData['description'] ?? 'No description',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${DateFormat('MMM dd, yyyy').format(startTime)} • ${DateFormat('HH:mm').format(startTime)} - ${DateFormat('HH:mm').format(endTime)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.people, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '$currentParticipants/$maxParticipants participants',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Text(
                  '\$${classData['price'] ?? '0'}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _editClass(classData),
                    icon: const Icon(Icons.edit, size: 16),
                    label: const Text('Edit'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _viewClassDetails(classData),
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('View'),
                  ),
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
    switch (status.toLowerCase()) {
      case 'scheduled':
        color = Colors.blue;
        label = 'Scheduled';
        break;
      case 'active':
        color = Colors.green;
        label = 'Active';
        break;
      case 'completed':
        color = Colors.grey;
        label = 'Completed';
        break;
      case 'cancelled':
        color = Colors.red;
        label = 'Cancelled';
        break;
      default:
        color = Colors.orange;
        label = 'Pending';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
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

  void _showCreateClassDialog() {
    showDialog(
      context: context,
      builder: (context) => CreateClassDialog(
        onClassCreated: _loadClasses,
      ),
    );
  }

  void _editClass(Map<String, dynamic> classData) {
    showDialog(
      context: context,
      builder: (context) => CreateClassDialog(
        classData: classData,
        onClassCreated: _loadClasses,
      ),
    );
  }

  void _viewClassDetails(Map<String, dynamic> classData) {
    showDialog(
      context: context,
      builder: (context) => ClassDetailsDialog(classData: classData),
    );
  }
}

class CreateClassDialog extends StatefulWidget {
  final Map<String, dynamic>? classData;
  final VoidCallback onClassCreated;

  const CreateClassDialog({
    super.key,
    this.classData,
    required this.onClassCreated,
  });

  @override
  State<CreateClassDialog> createState() => _CreateClassDialogState();
}

class _CreateClassDialogState extends State<CreateClassDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _maxParticipantsController = TextEditingController();
  
  String _selectedType = 'hatha';
  String _selectedLevel = 'beginner';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1);
  bool _isLoading = false;

  final _supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    if (widget.classData != null) {
      _populateFields();
    }
  }

  void _populateFields() {
    final data = widget.classData!;
    _titleController.text = data['title'] ?? '';
    _descriptionController.text = data['description'] ?? '';
    _priceController.text = data['price']?.toString() ?? '';
    _maxParticipantsController.text = data['max_participants']?.toString() ?? '';
    _selectedType = data['type'] ?? 'hatha';
    _selectedLevel = data['level'] ?? 'beginner';
    
    if (data['start_time'] != null) {
      final startDateTime = DateTime.parse(data['start_time']);
      _selectedDate = startDateTime;
      _startTime = TimeOfDay.fromDateTime(startDateTime);
    }
    
    if (data['end_time'] != null) {
      final endDateTime = DateTime.parse(data['end_time']);
      _endTime = TimeOfDay.fromDateTime(endDateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.classData == null ? 'Create New Class' : 'Edit Class',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'Class Title',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value?.isEmpty == true ? 'Required' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          validator: (value) => value?.isEmpty == true ? 'Required' : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedType,
                                decoration: const InputDecoration(
                                  labelText: 'Yoga Type',
                                  border: OutlineInputBorder(),
                                ),
                                items: const [
                                  DropdownMenuItem(value: 'hatha', child: Text('Hatha')),
                                  DropdownMenuItem(value: 'vinyasa', child: Text('Vinyasa')),
                                  DropdownMenuItem(value: 'ashtanga', child: Text('Ashtanga')),
                                  DropdownMenuItem(value: 'kundalini', child: Text('Kundalini')),
                                  DropdownMenuItem(value: 'yin', child: Text('Yin')),
                                  DropdownMenuItem(value: 'power', child: Text('Power')),
                                ],
                                onChanged: (value) => setState(() => _selectedType = value!),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedLevel,
                                decoration: const InputDecoration(
                                  labelText: 'Level',
                                  border: OutlineInputBorder(),
                                ),
                                items: const [
                                  DropdownMenuItem(value: 'beginner', child: Text('Beginner')),
                                  DropdownMenuItem(value: 'intermediate', child: Text('Intermediate')),
                                  DropdownMenuItem(value: 'advanced', child: Text('Advanced')),
                                  DropdownMenuItem(value: 'all_levels', child: Text('All Levels')),
                                ],
                                onChanged: (value) => setState(() => _selectedLevel = value!),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _priceController,
                                decoration: const InputDecoration(
                                  labelText: 'Price (\$)',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) => value?.isEmpty == true ? 'Required' : null,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: _maxParticipantsController,
                                decoration: const InputDecoration(
                                  labelText: 'Max Participants',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) => value?.isEmpty == true ? 'Required' : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: _selectDate,
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Date',
                                    border: OutlineInputBorder(),
                                  ),
                                  child: Text(DateFormat('MMM dd, yyyy').format(_selectedDate)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: InkWell(
                                onTap: _selectStartTime,
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Start Time',
                                    border: OutlineInputBorder(),
                                  ),
                                  child: Text(_startTime.format(context)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: InkWell(
                                onTap: _selectEndTime,
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'End Time',
                                    border: OutlineInputBorder(),
                                  ),
                                  child: Text(_endTime.format(context)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _saveClass,
                      child: _isLoading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(widget.classData == null ? 'Create' : 'Update'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() => _selectedDate = date);
    }
  }

  Future<void> _selectStartTime() async {
    final time = await showTimePicker(context: context, initialTime: _startTime);
    if (time != null) {
      setState(() => _startTime = time);
    }
  }

  Future<void> _selectEndTime() async {
    final time = await showTimePicker(context: context, initialTime: _endTime);
    if (time != null) {
      setState(() => _endTime = time);
    }
  }

  Future<void> _saveClass() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final user = _supabase.auth.currentUser;
      if (user == null) throw 'User not authenticated';

      // Get trainer ID
      final trainerResponse = await _supabase
          .from('trainers')
          .select('id')
          .eq('user_id', user.id)
          .single();

      final trainerId = trainerResponse['id'];

      final startDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _startTime.hour,
        _startTime.minute,
      );

      final endDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _endTime.hour,
        _endTime.minute,
      );

      final classData = {
        'trainer_id': trainerId,
        'title': _titleController.text,
        'description': _descriptionController.text,
        'type': _selectedType,
        'level': _selectedLevel,
        'start_time': startDateTime.toIso8601String(),
        'end_time': endDateTime.toIso8601String(),
        'max_participants': int.parse(_maxParticipantsController.text),
        'price': double.parse(_priceController.text),
        'status': 'scheduled',
        'current_participants': 0,
        'updated_at': DateTime.now().toIso8601String(),
      };

      if (widget.classData == null) {
        // Create new class
        await _supabase.from('classes').insert(classData);
      } else {
        // Update existing class
        await _supabase
            .from('classes')
            .update(classData)
            .eq('id', widget.classData!['id']);
      }

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.classData == null 
                ? 'Class created successfully!' 
                : 'Class updated successfully!'),
          ),
        );
        widget.onClassCreated();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _maxParticipantsController.dispose();
    super.dispose();
  }
}

class ClassDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> classData;

  const ClassDetailsDialog({super.key, required this.classData});

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime.parse(classData['start_time']);
    final endTime = DateTime.parse(classData['end_time']);

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                classData['title'] ?? 'Class Details',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              _buildDetailRow('Type', classData['type']?.toString().toUpperCase()),
              _buildDetailRow('Level', classData['level']?.toString().replaceAll('_', ' ').toUpperCase()),
              _buildDetailRow('Date', DateFormat('MMM dd, yyyy').format(startTime)),
              _buildDetailRow('Time', '${DateFormat('HH:mm').format(startTime)} - ${DateFormat('HH:mm').format(endTime)}'),
              _buildDetailRow('Duration', '${endTime.difference(startTime).inMinutes} minutes'),
              _buildDetailRow('Participants', '${classData['current_participants'] ?? 0}/${classData['max_participants'] ?? 0}'),
              _buildDetailRow('Price', '\$${classData['price'] ?? '0'}'),
              _buildDetailRow('Status', classData['status']?.toString().toUpperCase()),
              const SizedBox(height: 16),
              if (classData['description'] != null) ...[
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(classData['description']),
                const SizedBox(height: 16),
              ],
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
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value ?? 'Not set'),
          ),
        ],
      ),
    );
  }
}