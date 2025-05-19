import 'package:flutter/material.dart';

class Meetup {
  final String id;
  final String title;
  final DateTime date;
  final String description;
  final List<String> registeredUsers;

  Meetup({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.registeredUsers,
  });
}

class MeetupService extends ChangeNotifier {
  List<Meetup> _meetups = [];

  List<Meetup> get meetups => _meetups;

  void setMeetups(List<Meetup> meetups) {
    _meetups = meetups;
    notifyListeners();
  }

  void addMeetup(Meetup meetup) {
    _meetups.add(meetup);
    notifyListeners();
  }
} 