import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/trainer_provider.dart';
import '../../models/trainer.dart';
import '../../widgets/trainer_card.dart';

class TrainersListScreen extends StatefulWidget {
  const TrainersListScreen({Key? key}) : super(key: key);

  @override
  State<TrainersListScreen> createState() => _TrainersListScreenState();
}

class _TrainersListScreenState extends State<TrainersListScreen> {
  String _searchQuery = '';
  String _selectedSpecialization = 'All';
  String _sortBy = 'rating'; // 'rating', 'experience', 'price'
  
  final List<String> _specializations = [
    'All',
    'Hatha',
    'Vinyasa',
    'Ashtanga',
    'Yin',
    'Prenatal',
    'Power Yoga',
  ];

  @override
  Widget build(BuildContext context) {
    final trainers = Provider.of<TrainerProvider>(context).trainers;
    final filteredTrainers = _filterTrainers(trainers);
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 16),
                  _buildSpecializationFilter(),
                  const SizedBox(height: 16),
                  _buildSortingOptions(),
                ],
              ),
            ),
          ),
          _buildTrainersList(filteredTrainers),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      pinned: true,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Yoga Trainers',
          style: TextStyle(color: Colors.white),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withAlpha((0.8 * 255).round()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Search trainers...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildSpecializationFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _specializations.map((specialization) {
          final isSelected = _selectedSpecialization == specialization;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selected: isSelected,
              label: Text(specialization),
              onSelected: (selected) {
                setState(() {
                  _selectedSpecialization = selected ? specialization : 'All';
                });
              },
              backgroundColor: isSelected ? Theme.of(context).primaryColor : Colors.grey[200],
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSortingOptions() {
    return Row(
      children: [
        const Text('Sort by: ', style: TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          value: _sortBy,
          items: const [
            DropdownMenuItem(value: 'rating', child: Text('Rating')),
            DropdownMenuItem(value: 'experience', child: Text('Experience')),
            DropdownMenuItem(value: 'price', child: Text('Price')),
          ],
          onChanged: (value) {
            setState(() {
              _sortBy = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildTrainersList(List<Trainer> trainers) {
    if (trainers.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_search, size: 64, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(
                'No trainers found',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final trainer = trainers[index];
            return TrainerCard(trainer: trainer);
          },
          childCount: trainers.length,
        ),
      ),
    );
  }

  List<Trainer> _filterTrainers(List<Trainer> trainers) {
    var filtered = trainers.where((trainer) {
      final matchesSearch = trainer.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesSpecialization = _selectedSpecialization == 'All' ||
          trainer.specializations.contains(_selectedSpecialization);
      return matchesSearch && matchesSpecialization;
    }).toList();

    switch (_sortBy) {
      case 'rating':
        filtered.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'experience':
        filtered.sort((a, b) => b.experience.compareTo(a.experience));
        break;
      case 'price':
        filtered.sort((a, b) => a.pricing.compareTo(b.pricing));
        break;
    }

    return filtered;
  }
} 