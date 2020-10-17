import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../models/news_item_model.dart';

import '../../environment.dart';

class NewsProvider with ChangeNotifier {
  Map<String, NewsItemModel> _titleToNewsItemDataMap = {};

  Future<void> refreshNewsStream(String newsStreamUrl) async {
    var getResponse;

    try {
      getResponse = await http.get(
        newsStreamUrl,
        headers: {
          'X-Api-Key': NEWS_API_KEY,
        },
      );
    } catch (exception) {
      throw exception;
    }

    final responseData = json.decode(getResponse.body);
    print(responseData);
    List<dynamic> articleList = responseData['articles'] as List<dynamic>;

    _titleToNewsItemDataMap = articleList
        .map((article) {
          return NewsItemModel(
            articleUrl: article['url'],
            author: article['author'],
            description: article['description'] ?? article['content'],
            imageUrl: article['urlToImage'],
            publishedBy: article['publishedAt'],
            source: article['source']['name'],
            title: article['title'],
          );
        })
        .toList()
        .fold(
            {},
            (previousMapInstance, newsItemModelInstance) => {
                  ...previousMapInstance,
                  newsItemModelInstance.title: newsItemModelInstance,
                });

    notifyListeners();
  }

  List<String> get titleList {
    return _titleToNewsItemDataMap.keys.toList();
  }

  NewsItemModel getModelDataByTitle(String articleTitle) {
    return _titleToNewsItemDataMap[articleTitle];
  }
}
