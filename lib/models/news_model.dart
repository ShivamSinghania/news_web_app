class NewsModel {
  final String sourceId;
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsModel({
    required this.sourceId,
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      sourceId: json['source']['id'] ?? 'X',
      sourceName: json['source']['name'] ?? 'X News',
      author: json['author'] ?? 'Reporter',
      title: json['title'] ?? 'Breaking News',
      description: json['description'] ?? '',
      url: json['url'] ?? 'https://news.google.com/',
      urlToImage: json['urlToImage'] ?? 'https://picsum.photos/100',
      publishedAt: json['publishedAt'] ?? "2021-05-27T10:18:00Z",
      content: json['content'] ?? '',
    );
  }
}
