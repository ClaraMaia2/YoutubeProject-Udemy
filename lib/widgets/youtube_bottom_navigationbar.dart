import 'package:flutter/material.dart';
import 'package:youtube_project/pages/home_page.dart';
import 'package:youtube_project/pages/hots_page.dart';
import 'package:youtube_project/pages/library_page.dart';
import 'package:youtube_project/pages/subscription_page.dart';

class YoutubeBottomNavigationbar extends StatefulWidget {
  const YoutubeBottomNavigationbar({super.key});

  @override
  State<YoutubeBottomNavigationbar> createState() =>
      _YoutubeBottomNavigationbarState();
}

class _YoutubeBottomNavigationbarState
    extends State<YoutubeBottomNavigationbar> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    HotsPage(),
    SubscriptionPage(),
    LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      elevation: 20,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Hot",
          icon: Icon(Icons.whatshot),
        ),
        BottomNavigationBarItem(
          label: "Subscriptions",
          icon: Icon(Icons.subscriptions),
        ),
        BottomNavigationBarItem(
          label: "Library",
          icon: Icon(Icons.video_library_sharp),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pages[_currentIndex],
          ),
        );
      },
    );
  }
}
