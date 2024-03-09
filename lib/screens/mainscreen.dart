import 'package:flutter/material.dart';
import 'package:instagram/screens/activity_sceen.dart';
import 'package:instagram/screens/add_content_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottom = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xff272B40),
                onTap: (int index) {
                  setState(() {
                    _selectedBottom = index;
                  });
                },
                currentIndex: _selectedBottom,
                // selectedFontSize: 20,
                // selectedIconTheme: IconThemeData(color: Colors.black),
                // selectedItemColor: Colors.red,
                // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                // //
                // unselectedFontSize: 12,
                // unselectedItemColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset('images/icon_home.png'),
                    activeIcon: Image.asset('images/icon_active_home.png'),
                    label: 'item 1',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('images/icon_search_navigation.png'),
                    activeIcon:
                        Image.asset('images/icon_search_navigation_active.png'),
                    label: 'item 2',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('images/icon_add_navigation.png'),
                    activeIcon:
                        Image.asset('images/icon_add_navigation_active.png'),
                    label: 'item 3',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('images/icon_activity_navigation.png'),
                    activeIcon: Image.asset(
                        'images/icon_activity_navigation_active.png'),
                    label: 'item 4',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color(0xffC5C5C5),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          'images/profile.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    activeIcon: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color(0xffF35383),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          'images/profile.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    label: 'item 5',
                  ),
                ]),
          ),
        ),
        body: IndexedStack(
          index: _selectedBottom,
          children: getLayout(),
        ));
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchSceen(),
      AddContent(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
