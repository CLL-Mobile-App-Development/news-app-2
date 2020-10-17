import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './news_grid_item.dart';

import '../providers/news_provider.dart';
import '../providers/scroll_position_provider.dart';

class NewsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final articleTitles = Provider.of<NewsProvider>(context).titleList;

    final articleTitles = context.watch<NewsProvider>().titleList;


    return NotificationListener(
      onNotification: (notification){
               if(notification is ScrollUpdateNotification){
                 print(notification.scrollDelta);
                 Provider.of<ScrollPositionProvider>(context, listen:false).storeScrollPosition = notification.scrollDelta;
                 return true;
               }
                 return false;
      },
          child: GridView.builder(
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
          childAspectRatio: 1.7 / 2.45,
        ),
      ),
    );
  }
}
