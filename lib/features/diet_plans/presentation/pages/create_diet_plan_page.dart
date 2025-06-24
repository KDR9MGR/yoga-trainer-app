import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:trainer_manager_pro/features/diet_plans/presentation/controllers/diet_plan_controller.dart';
import 'package:trainer_manager_pro/shared/domain/entities/diet_plan.dart';

class CreateDietPlanPage extends ConsumerStatefulWidget {
  final String trainerId;
  final DietPlan? dietPlan; // For editing existing plan

  const CreateDietPlanPage({
    super.key,
    required this.trainerId,
    this.dietPlan,
  });

  @override
  ConsumerState<CreateDietPlanPage> createState() => _CreateDietPlanPageState();
}

class _CreateDietPlanPageState extends ConsumerState<CreateDietPlanPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dailyCaloriesController = TextEditingController();
  final _notesController = TextEditingController();
  
  String _selectedGoal = 'weight_loss';
  double _proteinPercentage = 30;
  double _carbsPercentage = 40;
  double _fatsPercentage = 30;
  
  List<DietMealPlan> _mealPlans = [];
  List<String> _restrictions = [];

  final List<String> _goalOptions = [
    'weight_loss',
    'muscle_gain',
    'maintenance',
    'endurance',
    'strength',
  ];

  final List<String> _commonRestrictions = [
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Dairy-Free',
    'Nut-Free',
    'Low-Sodium',
    'Keto',
    'Paleo',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.dietPlan != null) {
      _populateFields();
    } else {
      _addDefaultMealPlans();
    }
  }

  void _populateFields() {
    final plan = widget.dietPlan!;
    _titleController.text = plan.title;
    _descriptionController.text = plan.description;
    _dailyCaloriesController.text = plan.dailyCalories.toString();
    _notesController.text = plan.notes ?? '';
    _selectedGoal = plan.goal;
    _mealPlans = List.from(plan.mealPlans);
    _restrictions = List.from(plan.restrictions ?? []);
    
    final macros = plan.macros;
    _proteinPercentage = (macros['protein'] ?? 30).toDouble();
    _carbsPercentage = (macros['carbs'] ?? 40).toDouble();
    _fatsPercentage = (macros['fats'] ?? 30).toDouble();
  }

  void _addDefaultMealPlans() {
    _mealPlans = [
      const DietMealPlan(
        mealType: 'breakfast',
        items: [],
        calories: 0,
      ),
      const DietMealPlan(
        mealType: 'lunch',
        items: [],
        calories: 0,
      ),
      const DietMealPlan(
        mealType: 'dinner',
        items: [],
        calories: 0,
      ),
      const DietMealPlan(
        mealType: 'snack',
        items: [],
        calories: 0,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.dietPlan != null;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Diet Plan' : 'Create Diet Plan'),
        actions: [
          TextButton(
            onPressed: _saveDietPlan,
            child: const Text(
              'Save',
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
              _buildGoalSection(),
              const SizedBox(height: 24),
              _buildCaloriesSection(),
              const SizedBox(height: 24),
              _buildMacrosSection(),
              const SizedBox(height: 24),
              _buildRestrictionsSection(),
              const SizedBox(height: 24),
              _buildMealPlansSection(),
              const SizedBox(height: 24),
              _buildNotesSection(),
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
          'Basic Information',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Plan Title',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.title),
          ),
          validator: (value) => value?.isEmpty == true ? 'Title is required' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _descriptionController,
          decoration: const InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.description),
          ),
          maxLines: 3,
          validator: (value) => value?.isEmpty == true ? 'Description is required' : null,
        ),
      ],
    );
  }

  Widget _buildGoalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Goal',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _selectedGoal,
          decoration: const InputDecoration(
            labelText: 'Fitness Goal',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.track_changes),
          ),
          items: _goalOptions.map((goal) {
            return DropdownMenuItem(
              value: goal,
              child: Text(_formatGoal(goal)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedGoal = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCaloriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daily Calories',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _dailyCaloriesController,
          decoration: const InputDecoration(
            labelText: 'Calories per Day',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.local_fire_department),
            suffixText: 'cal',
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value?.isEmpty == true) return 'Daily calories is required';
            final calories = int.tryParse(value!);
            if (calories == null || calories <= 0) {
              return 'Please enter a valid calorie amount';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildMacrosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Macronutrients Distribution',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildMacroSlider(
          'Protein',
          _proteinPercentage,
          Colors.red,
          (value) => setState(() => _proteinPercentage = value),
        ),
        const SizedBox(height: 16),
        _buildMacroSlider(
          'Carbohydrates',
          _carbsPercentage,
          Colors.orange,
          (value) => setState(() => _carbsPercentage = value),
        ),
        const SizedBox(height: 16),
        _buildMacroSlider(
          'Fats',
          _fatsPercentage,
          Colors.blue,
          (value) => setState(() => _fatsPercentage = value),
        ),
        const SizedBox(height: 8),
        Text(
          'Total: ${(_proteinPercentage + _carbsPercentage + _fatsPercentage).toInt()}%',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: (_proteinPercentage + _carbsPercentage + _fatsPercentage).toInt() == 100
                ? Colors.green
                : Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _buildMacroSlider(
    String name,
    double value,
    Color color,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Text('${value.toInt()}%'),
          ],
        ),
        Slider(
          value: value,
          min: 5,
          max: 70,
          divisions: 13,
          activeColor: color,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildRestrictionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dietary Restrictions',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _commonRestrictions.map((restriction) {
            final isSelected = _restrictions.contains(restriction);
            return FilterChip(
              label: Text(restriction),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _restrictions.add(restriction);
                  } else {
                    _restrictions.remove(restriction);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildMealPlansSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Meal Plans',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton.icon(
              onPressed: _addMealPlan,
              icon: const Icon(Icons.add),
              label: const Text('Add Meal'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ..._mealPlans.asMap().entries.map((entry) {
          final index = entry.key;
          final mealPlan = entry.value;
          return _buildMealPlanCard(mealPlan, index);
        }),
      ],
    );
  }

  Widget _buildMealPlanCard(DietMealPlan mealPlan, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatMealType(mealPlan.mealType),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _editMealPlan(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removeMealPlan(index),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '${mealPlan.items.length} items • ${mealPlan.calories} calories',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Notes',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _notesController,
          decoration: const InputDecoration(
            labelText: 'Notes (optional)',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.notes),
          ),
          maxLines: 4,
        ),
      ],
    );
  }

  String _formatGoal(String goal) {
    return goal.split('_').map((word) => 
        word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  String _formatMealType(String mealType) {
    return mealType[0].toUpperCase() + mealType.substring(1);
  }

  void _addMealPlan() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Meal'),
        content: const Text('Meal planning functionality will be enhanced in the next update.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _editMealPlan(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Meal'),
        content: const Text('Meal editing functionality will be enhanced in the next update.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _removeMealPlan(int index) {
    setState(() {
      _mealPlans.removeAt(index);
    });
  }

  void _saveDietPlan() async {
    if (!_formKey.currentState!.validate()) return;

    // Validate macros total to 100%
    final macrosTotal = _proteinPercentage + _carbsPercentage + _fatsPercentage;
    if (macrosTotal.toInt() != 100) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Macronutrients must total 100%'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final dietPlan = DietPlan(
        id: widget.dietPlan?.id ?? const Uuid().v4(),
        trainerId: widget.trainerId,
        clientId: widget.dietPlan?.clientId ?? 'temp_client_id', // TODO: Select client
        title: _titleController.text,
        description: _descriptionController.text,
        goal: _selectedGoal,
        dailyCalories: int.parse(_dailyCaloriesController.text),
        macros: {
          'protein': _proteinPercentage,
          'carbs': _carbsPercentage,
          'fats': _fatsPercentage,
        },
        mealPlans: _mealPlans,
        restrictions: _restrictions.isEmpty ? null : _restrictions,
        notes: _notesController.text.isEmpty ? null : _notesController.text,
        createdAt: widget.dietPlan?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (widget.dietPlan != null) {
        await ref.read(dietPlanControllerProvider.notifier).updateDietPlan(dietPlan);
      } else {
        await ref.read(dietPlanControllerProvider.notifier).createDietPlan(dietPlan);
      }

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.dietPlan != null 
                ? 'Diet plan updated successfully' 
                : 'Diet plan created successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving diet plan: $e'),
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
    _dailyCaloriesController.dispose();
    _notesController.dispose();
    super.dispose();
  }
} 