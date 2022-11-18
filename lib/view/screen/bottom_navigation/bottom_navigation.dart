import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view/screen/screen.dart';
import 'package:turf_booking/view_model/bottom_navigation_view_model.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> screens = [
      const HomePage(),
      const SpotPage(),
      const ProfilePage(),
    ];
    final controller = Provider.of<BottomNavigationBarViewModel>(context);
    int currentScreenIndex = controller.currentIndexSearch();
    return Scaffold(
      body: screens[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreenIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: (index) {
          controller.changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              currentScreenIndex == 0
                  ? CupertinoIcons.home
                  : Icons.home_rounded,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentScreenIndex == 1
                  ? CupertinoIcons.search
                  : Icons.search_rounded,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentScreenIndex == 2
                  ? CupertinoIcons.person
                  : Icons.person_rounded,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
