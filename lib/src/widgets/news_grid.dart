import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './news_grid_item.dart';

import '../providers/news_provider.dart';

class NewsGrid extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final articleTitles = Provider.of<NewsProvider>(context).titleList;

    return GridView.builder(
      itemCount: articleTitles.length,
      itemBuilder: (builderContext, articleIdx) {
        return NewsGridItem(
          title: articleTitles[articleIdx],
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
