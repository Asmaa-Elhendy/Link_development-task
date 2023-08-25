class Article{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  Article({required this.author,required this.title,required this.description,required this.url,required this.urlToImage,required
      this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json["author"]??'',
      title: json["title"]??'',
      description: json["description"]??'',
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: json["publishedAt"]??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "author": this.author,
      "title": this.title,
      "description": this.description,
      "url": this.url,
      "urlToImage": this.urlToImage,
      "publishedAt": this.publishedAt,
    };
  }
}