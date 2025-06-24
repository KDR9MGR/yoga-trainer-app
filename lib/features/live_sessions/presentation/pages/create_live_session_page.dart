import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/features/live_sessions/presentation/controllers/live_session_controller.dart';

class CreateLiveSessionPage extends ConsumerStatefulWidget {
  const CreateLiveSessionPage({super.key});

  @override
  ConsumerState<CreateLiveSessionPage> createState() => _CreateLiveSessionPageState();
}

class _CreateLiveSessionPageState extends ConsumerState<CreateLiveSessionPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  String? _selectedClassId;
  DateTime _selectedDate = DateTime.now().add(const Duration(hours: 1));
  TimeOfDay _selectedTime = TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1);
  int _durationMinutes = 60;
  
  List<Map<String, dynamic>> _classes = [];
  String? _trainerId;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadTrainerData();
  }

  Future<void> _loadTrainerData() async {
    setState(() => _isLoading = true);
    
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user != null) {
        // Get trainer ID
        final trainerResponse = await Supabase.instance.client
            .from('trainers')
            .select('id')
            .eq('user_id', user.id)
            .single();
        
        _trainerId = trainerResponse['id'];
        
        // Get trainer's classes
        final classesResponse = await Supabase.instance.client
            .from('classes')
            .select('id, title, description')
            .eq('trainer_id', _trainerId!)
            .order('created_at', ascending: false);
        
        setState(() {
          _classes = List<Map<String, dynamic>>.from(classesResponse);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading data: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Live Session'),
        actions: [
          TextButton(
            onPressed: _createSession,
            child: const Text(
              'Create',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBasicInfoSection(),
              const SizedBox(height: 24),
              _buildClassSelectionSection(),
              const SizedBox(height: 24),
              _buildScheduleSection(),
              const SizedBox(height: 24),
              _buildDurationSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBasicInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Session Details',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Session Title',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.title),
            hintText: 'e.g., Morning Yoga Flow',
          ),
          validator: (value) => value?.isEmpty == true ? 'Title is required' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _descriptionController,
          decoration: const InputDecoration(
            labelText: 'Description (Optional)',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.description),
            hintText: 'Brief description of the session',
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildClassSelectionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Class',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _selectedClassId,
          decoration: const InputDecoration(
            labelText: 'Class',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.fitness_center),
          ),
                     items: _classes.map((classData) {
             return DropdownMenuItem<String>(
               value: classData['id'] as String,
               child: Text(classData['title']),
             );
           }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedClassId = value;
            });
          },
          validator: (value) => value == null ? 'Please select a class' : null,
        ),
      ],
    );
  }

  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Schedule',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Date'),
                  subtitle: Text(DateFormat('MMM dd, yyyy').format(_selectedDate)),
                  onTap: _selectDate,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.access_time),
                  title: const Text('Time'),
                  subtitle: Text(_selectedTime.format(context)),
                  onTap: _selectTime,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDurationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Duration',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<int>(
                value: _durationMinutes,
                decoration: const InputDecoration(
                  labelText: 'Duration',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.timer),
                  suffixText: 'minutes',
                ),
                items: const [
                  DropdownMenuItem(value: 30, child: Text('30 minutes')),
                  DropdownMenuItem(value: 45, child: Text('45 minutes')),
                  DropdownMenuItem(value: 60, child: Text('1 hour')),
                  DropdownMenuItem(value: 90, child: Text('1.5 hours')),
                  DropdownMenuItem(value: 120, child: Text('2 hours')),
                ],
                onChanged: (value) {
                  setState(() {
                    _durationMinutes = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _createSession() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_trainerId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error: Trainer ID not found'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Combine date and time
      final scheduledDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      // Check if the scheduled time is in the future
      if (scheduledDateTime.isBefore(DateTime.now())) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Scheduled time must be in the future'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final sessionId = await ref.read(liveSessionControllerProvider.notifier).createLiveSession(
        trainerId: _trainerId!,
        classId: _selectedClassId!,
        title: _titleController.text,
        scheduledTime: scheduledDateTime,
        durationMinutes: _durationMinutes,
      );

      if (sessionId != null && mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Live session scheduled successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating session: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
} 