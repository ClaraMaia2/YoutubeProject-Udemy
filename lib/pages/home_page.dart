// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_project/api/api.dart';
import 'package:youtube_project/models/video.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required this.search,
  });

  String search;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  YoutubePlayerController? _youtubeController;
  bool _isVideoSelected = false;

  _listVideos(String search) {
    Api api = Api();

    return api.search(search);
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeOf = MediaQuery.of(context).size;

    return _isVideoSelected
        ? YoutubePlayer(
            controller: _youtubeController!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.white,
          )
        : FutureBuilder<List<Video>>(
            future: _listVideos(widget.search),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        List<Video> videos = snapshot.data!;
                        Video video = videos[index];
                        Size sizeOf = MediaQuery.of(context).size;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _youtubeController = YoutubePlayerController(
                                initialVideoId: video.id,
                                flags: const YoutubePlayerFlags(
                                  autoPlay: true,
                                  mute: false,
                                ),
                              );

                              _isVideoSelected = true;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: sizeOf.height * 0.23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(video.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  video.title,
                                ),
                                subtitle: Text(
                                  video.channel,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: sizeOf.height * 0.04,
                      ),
                      itemCount: snapshot.data!.length,
                    );
                  } else {
                    return const Center(
                      child: Text("No data to be shown"),
                    );
                  }
              }
            },
          );
  }

  @override
  void dispose() {
    _youtubeController!.dispose();

    _isVideoSelected = false;

    super.dispose();
  }
}
