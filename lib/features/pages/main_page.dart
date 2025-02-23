import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_sir_pandi/features/pages/dashboard.dart';
import 'package:task_sir_pandi/features/pages/profile/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    Dashboard(),
    Center(
      child: Text('Posts'),
    ),
    Center(
      child: Text('Profile'),
    ),
    Center(
      child: Text('Profile'),
    ),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 1,
          backgroundColor: Colors.grey.shade200,
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.brown.shade200,
          currentIndex: selectedIndex,
          selectedLabelStyle: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 10,
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.dmSans(fontSize: 10),
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(selectedIndex == 0
                  ? 'assets/svg/home_selected.svg'
                  : 'assets/svg/home_icon.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(selectedIndex == 1
                  ? 'assets/svg/discover_selected.svg'
                  : 'assets/svg/discover_icon.svg'),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/plus_icon.svg',
                height: 50,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(selectedIndex == 3
                  ? 'assets/svg/activity_selected.svg'
                  : 'assets/svg/activity_icon.svg'),
              label: 'My Activity',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(selectedIndex == 4
                  ? 'assets/svg/profile_selected.svg'
                  : 'assets/svg/profile_icon.svg'),
              label: 'Profile',
            ),
          ]),
    );
  }
}
