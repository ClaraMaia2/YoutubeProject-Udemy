class Video {
  String id;
  String title;
  String image;
  String channel;
  String description;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.channel,
  });

  // Resolve o problema, mas não é otimizado pois, toda vez que roda ele, cria uma nova instância de Video
  // static convertJson(Map<String, dynamic> json) {
  //   return Video(
  //     id: json["id"]["videoId"],
  //     title: json["snippet"]["title"],
  //     channel: json["snippet"]["channelId"],
  //     description: json["snippet"]["description"],
  //     image: json["snippet"]["thumbnails"]["high"]["url"],
  //   );
  // }

  // O retorno é de somente um objeto
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      channel: json["snippet"]["channelTitle"],
      description: json["snippet"]["description"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
    );
  }
}
