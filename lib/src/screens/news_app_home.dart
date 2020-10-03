import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../environment.dart';
import '../widgets/side_drawer.dart';
import '../widgets/news_grid.dart';

class NewsAppHome extends StatefulWidget {
  static String routeName = '/';

  @override
  _NewsAppHomeState createState() => _NewsAppHomeState();
}

class _NewsAppHomeState extends State<NewsAppHome> {
  List<dynamic> news = [];
  bool isLoading = false;

  String _streamName = 'Top-Headlines';
  String _streamUrl = 'https://newsapi.org/v2/top-headlines?country=us';

  @override
  void didChangeDependencies() {
    final Map<String, String> routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    if (routeArguments != null) {
      _streamName = routeArguments['streamName'];
      _streamUrl = routeArguments['streamUrl'];
    }

    print('Stream name: $_streamName, Stream url: $_streamUrl');

    super.didChangeDependencies();
  }

  Future<Map<String, dynamic>> getNewsStream() async {
    String url = _streamUrl;

    final getResponse = await http.get(
      url,
      headers: {
        'X-Api-Key': NEWS_API_KEY,
      },
    );

    print('Get response body: ${json.decode(getResponse.body)}');
    return json.decode(getResponse.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _streamName,
        ),
      ),
      body: FutureBuilder(
          future: getNewsStream(),
          builder: (builderContext, newsStreamSnapshot) {
            if (newsStreamSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (newsStreamSnapshot.hasError) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error,
                      color: Theme.of(context).errorColor,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Error loading news stream !',
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // Successful request

              return NewsGrid(
                articleList: newsStreamSnapshot.data['articles'],
              );
            }
          }),
      drawer: SideDrawer(),
    );
  }
}
