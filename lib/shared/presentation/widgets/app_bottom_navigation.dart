import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trainer_manager_pro/core/constants/app_constants.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentLocation = GoRouterState.of(context).uri.toString();

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _getCurrentIndex(currentLocation),
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Classes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Students',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Diet Plans',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  int _getCurrentIndex(String location) {
    if (location.startsWith(AppConstants.dashboardRoute)) {
      return 0;
    } else if (location.startsWith(AppConstants.classesRoute)) {
      return 1;
    } else if (location.startsWith(AppConstants.studentsRoute)) {
      return 2;
    } else if (location.startsWith(AppConstants.dietPlansRoute)) {
      return 3;
    } else if (location.startsWith(AppConstants.profileRoute)) {
      return 4;
    }
    return 0; // Default to dashboard
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppConstants.dashboardRoute);
        break;
      case 1:
        context.go(AppConstants.classesRoute);
        break;
      case 2:
        context.go(AppConstants.studentsRoute);
        break;
      case 3:
        context.go(AppConstants.dietPlansRoute);
        break;
      case 4:
        context.go(AppConstants.profileRoute);
        break;
    }
  }
} 