import 'package:flutter/material.dart';
import 'package:oreo_app/presentation/home_screen/view/home_screen.dart';
import 'package:oreo_app/presentation/scanner_screen/view/scanner_screen.dart';
import 'package:oreo_app/presentation/settings_screen/view/settings_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  final String email; // Add an email parameter to the constructor

  BottomNavigationScreen({required this.email}); // Constructor to receive email

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int index = 0; 
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(email: widget.email),
      ScannerScreen(),
      SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.all(15.0), 
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0), 
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10, 
                offset: Offset(0, -5), 
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                30.0), 
            child: BottomNavigationBar(
              onTap: (tapIndex) {
                setState(() {
                  index = tapIndex;
                });
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue, 
              unselectedItemColor: Colors.grey, 
              currentIndex: index, 
              elevation: 0, 
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.flip_to_front_rounded,
                    size: 30,
                  ),
                  label: 'Add Item',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 30,
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
