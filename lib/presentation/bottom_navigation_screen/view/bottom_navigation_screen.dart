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
  int index = 0; // Start with the first screen (index 0)

  // Screens to display for each bottom navigation item
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    // Initialize the screens with the provided email
    screens = [
      HomeScreen(email: widget.email),
      ScannerScreen(),
      SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index], // Show the currently selected screen
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.all(15.0), // Adjust the distance to edges here
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color for the container
            borderRadius: BorderRadius.circular(10.0), // Circular edges
            boxShadow: [
              BoxShadow(
                color: Colors.black12, // Shadow color
                blurRadius: 10, // Shadow blur radius
                offset: Offset(0, -5), // Shadow position (moving upward)
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                30.0), // Apply to both container and contents
            child: BottomNavigationBar(
              onTap: (tapIndex) {
                setState(() {
                  index = tapIndex; // Update the index to switch screens
                });
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue, // Selected item color
              unselectedItemColor: Colors.grey, // Unselected item color
              currentIndex: index, // Track the currently selected index
              elevation: 0, // Set elevation to 0 to prevent default shadow
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
