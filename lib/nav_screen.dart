import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyin_social_media_app/home_screen.dart';
import 'package:flyin_social_media_app/library.dart';
import 'package:flyin_social_media_app/video_making_page.dart';

class NavScreen extends StatefulWidget {

  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final _screens = [
    const HomeScreen(),
    const CameraPage(),
    const LibraryPage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100.0,
        leading: Image.asset('lib/assets/logo.png'),
        backgroundColor: Colors.black87,
        actions:  [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.notification_add_outlined),
              onPressed: (){},
            ),
          )
        ],

      ),
      backgroundColor: Colors.black87,

      body: Stack(

          children: _screens
              .asMap()
              .map((i, screen) => MapEntry(
            i,
            Offstage(
              offstage: _selectedIndex != i,
              child: screen,

            ),
          )).values.toList()

      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        showUnselectedLabels: false  ,
        unselectedItemColor: Colors.greenAccent,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Explore'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(Icons.add_circle),
              label: 'Explore'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_add_check_outlined),
              activeIcon: Icon(Icons.library_add_check_rounded),
              label: 'Library'
          ),
        ],
      ),
    );
  }
}