class NewsArticle implements Comparable<NewsArticle> {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  NewsArticle({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      sourceName: json['source']['name'] ?? "",
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt:
          DateTime.tryParse(json['publishedAt'] ?? "") ?? DateTime.now(),
      content: json['content'] ?? "",
    );
  }

  @override
  int compareTo(NewsArticle other) {
    // Sort the articles in reverse chronological order based on publishedAt
    return other.publishedAt.compareTo(publishedAt);
  }
}
