import 'package:flutter/material.dart';

import '../widgets/youtube_appbar.dart';
import '../widgets/youtube_bottom_navigationbar.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: YoutubeAppbar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: YoutubeBottomNavigationbar(),
    );
  }
}