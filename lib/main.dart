import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/screens/news_app_home.dart';

import 'src/providers/news_provider.dart';
import 'src/providers/scroll_position_provider.dart';
import 'src/providers/scroll_attributes_provider.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (builderContext) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (builderContext) => ScrollPositionProvider(),
        ),
        ChangeNotifierProxyProvider<ScrollPositionProvider,
            ScrollAttributesProvider>(
          create: (builderContext) => ScrollAttributesProvider(),
          update: (builderContext, scrollPosProviderInstance,
              prevScrollAttributesProvider) {
            return prevScrollAttributesProvider
              ..storeScrollPosAttributes =
                  scrollPosProviderInstance.fetchScrollPosition;
          },
        ),
      ],
      child: MaterialApp(
          title: 'News App',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.purple,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          //home: NewsAppHome(),
          routes: {
            NewsAppHome.routeName: (builderContext) => NewsAppHome(),
          }),
    );
  }
}
