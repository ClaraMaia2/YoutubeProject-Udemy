// ignore_for_file: avoid_print, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:youtube_project/pages/home_page.dart';
import 'package:youtube_project/pages/hots_page.dart';
import 'package:youtube_project/pages/library_page.dart';
import 'package:youtube_project/pages/subscription_page.dart';
import 'package:youtube_project/widgets/custom_search_delegate.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({
    super.key,
  });

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _currentIndex = 0;
  String _result = "";

  @override
  Widget build(BuildContext context) {
    final Size sizeOf = MediaQuery.of(context).size;
    List<Widget> pages = [
      HomePage(
        search: _result,
      ),
      const HotsPage(),
      const SubscriptionPage(),
      const LibraryPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/youtube.png',
          width: sizeOf.width * 0.3,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              String? res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );

              setState(() {
                _result = res ?? '';
                pages[0] = HomePage(search: _result);
              });

              print("result: $res");
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.videocam),
          //   onPressed: () {},
          // ),

          // IconButton(
          //   icon: const Icon(Icons.account_circle),
          //   onPressed: () {},
          // ),
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        elevation: 20,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Hot",
            icon: Icon(
              Icons.whatshot,
            ),
          ),
          BottomNavigationBarItem(
            label: "Subscriptions",
            icon: Icon(
              Icons.subscriptions,
            ),
          ),
          BottomNavigationBarItem(
            label: "Library",
            icon: Icon(
              Icons.video_library_sharp,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
