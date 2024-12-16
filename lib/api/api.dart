// ignore_for_file: constant_identifier_names, avoid_print
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_project/models/video.dart';

const KEY_YOUTUBE_API = "AIzaSyACrWf1VigP_fephhBuHvbBsOaO11stFWg";
const CHANNEL_ID = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const BASE_URL = "www.googleapis.com";

class Api {
  Future<List<Video>> search(String s) async {
    final Uri url = Uri.https(
      BASE_URL,
      '/youtube/v3/search',
      {
        'part': 'snippet',
        'channelId': CHANNEL_ID,
        'type': 'video',
        'maxResults': '20',
        'order': 'date',
        'key': KEY_YOUTUBE_API,
        'q': s,
      },
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      List<Video> videos = jsonData["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      throw Exception("Failed to load videos: ${response.statusCode}");
    }
  }
}
