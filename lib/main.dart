import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/members_screen.dart';
import 'screens/payments_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    DashboardScreen(),
    MembersScreen(),
    PaymentsScreen(),
    SettingsScreen(),
  ];

  // 🔥🔥🔥 ADD THIS FUNCTION (MAIN CHANGE)
  Widget buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),

        // 🔥 YELLOW BACKGROUND WHEN SELECTED
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,

              // 🔥 BLACK ICON WHEN SELECTED, ELSE YELLOW
              color: isSelected ? Colors.black : Colors.yellow,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,

                // 🔥 BLACK TEXT WHEN SELECTED, ELSE YELLOW
                color: isSelected ? Colors.black : Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      // 🔥 UPDATED CUSTOM NAV BAR (YOU ALREADY DID THIS 👍)
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(Icons.home, "Dashboard", 0),
            buildNavItem(Icons.people, "Members", 1),
            buildNavItem(Icons.payment, "Payments", 2),
            buildNavItem(Icons.settings, "Settings", 3),
          ],
        ),
      ),
    );
  }
}