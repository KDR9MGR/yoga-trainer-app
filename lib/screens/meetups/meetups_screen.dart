import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../utils/theme.dart';

class MeetupsScreen extends StatefulWidget {
  const MeetupsScreen({Key? key}) : super(key: key);

  @override
  State<MeetupsScreen> createState() => _MeetupsScreenState();
}

class _MeetupsScreenState extends State<MeetupsScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yoga Meetups'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filters
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCalendar(),
          Expanded(
            child: _buildMeetupsList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement create meetup
        },
        icon: const Icon(Icons.add),
        label: const Text('Create Meetup'),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2024, 1, 1),
      lastDay: DateTime.utc(2024, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      calendarStyle: CalendarStyle(
        selectedDecoration: const BoxDecoration(
          color: AppTheme.primaryGreen,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: AppTheme.primaryGreen.withAlpha((0.3 * 255).round()),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildMeetupsList() {
    final meetups = [
      {
        'title': 'Morning Flow in the Park',
        'time': '7:00 AM - 8:30 AM',
        'location': 'Central Park',
        'participants': 12,
        'maxParticipants': 20,
        'type': 'Vinyasa Flow',
        'host': 'Sarah Johnson',
      },
      {
        'title': 'Sunset Beach Yoga',
        'time': '6:00 PM - 7:30 PM',
        'location': 'Venice Beach',
        'participants': 8,
        'maxParticipants': 15,
        'type': 'Hatha Yoga',
        'host': 'Michael Chen',
      },
      {
        'title': 'Mindful Movement Workshop',
        'time': '10:00 AM - 12:00 PM',
        'location': 'Yoga Studio Downtown',
        'participants': 15,
        'maxParticipants': 25,
        'type': 'Workshop',
        'host': 'Emma Wilson',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: meetups.length,
      itemBuilder: (context, index) {
        final meetup = meetups[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withAlpha((0.1 * 255).round()),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.group,
                    size: 48,
                    color: AppTheme.primaryGreen,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            meetup['title'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryGreen.withAlpha((0.1 * 255).round()),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            meetup['type'] as String,
                            style: const TextStyle(
                              color: AppTheme.primaryGreen,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 16),
                        const SizedBox(width: 4),
                        Text(meetup['time'] as String),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 4),
                        Text(meetup['location'] as String),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.person, size: 16),
                        const SizedBox(width: 4),
                        Text('Hosted by ${meetup['host']}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: (meetup['participants'] as int) /
                                (meetup['maxParticipants'] as int),
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppTheme.primaryGreen,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${meetup['participants']}/${meetup['maxParticipants']}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // TODO: Implement view details
                            },
                            child: const Text('View Details'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Implement join meetup
                            },
                            child: const Text('Join'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 