import 'package:flutter/material.dart';

import '../widgets/youtube_appbar.dart';
import '../widgets/youtube_bottom_navigationbar.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: YoutubeAppbar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: YoutubeBottomNavigationbar(),
    );
  }
}