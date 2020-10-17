import 'package:flutter/foundation.dart';

class NewsItemModel {
  final String author;
  final String publishedBy;
  final String source;
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;

  NewsItemModel({
    @required this.author,
    @required this.publishedBy,
    @required this.source,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.articleUrl,
  });
}
