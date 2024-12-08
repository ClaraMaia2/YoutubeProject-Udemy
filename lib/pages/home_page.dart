// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:youtube_project/widgets/youtube_appbar.dart';
import 'package:youtube_project/widgets/youtube_bottom_navigationbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size sizeOf = MediaQuery.of(context).size;

    return const Scaffold(
      appBar: YoutubeAppbar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: YoutubeBottomNavigationbar(),
    );
  }
}
