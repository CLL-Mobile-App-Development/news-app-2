import 'package:flutter/material.dart';

import './news_grid_item.dart';

class NewsGrid extends StatelessWidget {
  final List<dynamic> articleList;

  NewsGrid({
    @required this.articleList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: articleList.length,
      itemBuilder: (builderContext, articleIdx) {
        return NewsGridItem(
          articleUrl: articleList[articleIdx]['url'],
          author: articleList[articleIdx]['author'],
          description: articleList[articleIdx]['description'] ??
              articleList[articleIdx]['content'],
          imageUrl: articleList[articleIdx]['urlToImage'],
          publishedBy: articleList[articleIdx]['publishedAt'],
          source: articleList[articleIdx]['source']['name'],
          title: articleList[articleIdx]['title'],
        );
      },
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
        childAspectRatio: 1.7/2.45,
      ),
    );
  }
}
