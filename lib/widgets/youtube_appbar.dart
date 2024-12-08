import 'package:flutter/material.dart';

class YoutubeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const YoutubeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final Size sizeOf = MediaQuery.of(context).size;

    return AppBar(
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
          icon: const Icon(Icons.videocam),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {},
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
