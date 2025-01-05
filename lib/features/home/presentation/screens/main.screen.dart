import 'package:flutter/material.dart';
import 'package:rm_app/features/home/presentation/screens/favorite.screen.dart';
import 'package:rm_app/features/home/presentation/screens/message.screen.dart';
import 'package:rm_app/features/home/presentation/screens/profile.screen.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import 'home.page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of screens to show
  final List<Widget> _screens = [
     HomepageScreen(),
    const MessagesScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

