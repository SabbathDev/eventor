import 'map.dart';
import 'package:eventor/pages/profile.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //add screen widget to list for tabs (mind order)
  List<Widget> pageList = <Widget>[
    const Scaffold(),
    const MapPage(),
    const ProfilePage()
  ];
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Events"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}
