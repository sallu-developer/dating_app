import 'package:flutter/material.dart';
import 'package:dating_app/presentation/pages/home_screen.dart';
import 'package:dating_app/presentation/pages/date_now_screen.dart';
import 'package:dating_app/presentation/pages/messages_list_screen.dart';
import 'package:dating_app/presentation/widgets/custom_bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(hideBottomNav: true),
    const DateNowScreen(),
    const Scaffold(body: Center(child: Text('Admirers'))),
    const MessagesListScreen(),
    const Scaffold(body: Center(child: Text('Events'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The current active page
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          
          // The shared bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNav(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
