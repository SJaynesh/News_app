class NewsModel {
  List articles;

  NewsModel({
    required this.articles,
  });

  factory NewsModel.fromMap({required Map data}) {
    return NewsModel(
      articles: data['articles']
    );
  }
}
