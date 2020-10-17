import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/side_drawer.dart';
import '../widgets/news_grid.dart';

import '../providers/news_provider.dart';

class NewsAppHome extends StatefulWidget {
  static String routeName = '/';

  @override
  _NewsAppHomeState createState() => _NewsAppHomeState();
}

class _NewsAppHomeState extends State<NewsAppHome> {
  List<dynamic> news = [];
  bool isLoading = false;
  bool isFirstLoad = true;
  bool isRefreshRequest = false;

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

  Future<void> getNewsStream() async {
    setState(() {
      isLoading = true;
    });

    if (isFirstLoad || isRefreshRequest) {
      try {
        await Provider.of<NewsProvider>(context, listen: false)
            .refreshNewsStream(_streamUrl);

        setState(() {
          isLoading = false;
          isFirstLoad = false;
          isRefreshRequest = false;
        });
      } catch (exception) {
        throw exception;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _streamName,
        ),
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                isRefreshRequest = true;
                getNewsStream();
              },
              child: FutureBuilder(
                  future: getNewsStream(),
                  builder: (builderContext, newsStreamSnapshot) {
                    if (newsStreamSnapshot.connectionState ==
                        ConnectionState.waiting) {
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

                      return NewsGrid();
                    }
                  }),
            ),
      drawer: SideDrawer(),
    );
  }
}
