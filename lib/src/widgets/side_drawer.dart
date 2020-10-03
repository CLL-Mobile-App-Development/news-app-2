import 'package:flutter/material.dart';

import '../screens/news_app_home.dart';


import '../../environment.dart';

class SideDrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'Pick a news stream',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.clear,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.line_weight,
              size: 17,
            ),
            title: Text(
              'Top Headlines',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed(NewsAppHome.routeName, arguments: routeArguments['top-headlines']),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.public,
              size: 17,
            ),
            title: Text(
              'News',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed(NewsAppHome.routeName, arguments: routeArguments['news']),
          ),
          Divider(),
        ],
      ),
    );
  }
}
