import 'package:all/screens/home/home_view/home_view.dart';
import 'package:all/screens/home/profile_view/main_profile.dart';
import 'package:all/screens/home/service_view/main_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _selectedIndex = 0;
final List<Widget> _screens = [HomeView(), MainService(), MainProfile()];

class _HomeScreenState extends State<HomeScreen> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Service'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          _bottomNavigationBarItems.elementAt(_selectedIndex).label ?? '',
        ),
      ),
      drawer: Drawer(),
      body: Scaffold(body: _screens.elementAt(_selectedIndex)),
    );
  }
}
