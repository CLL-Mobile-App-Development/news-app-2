import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsGridItem extends StatelessWidget {
  final String author;
  final String publishedBy;
  final String source;
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;

  NewsGridItem({
    @required this.author,
    @required this.publishedBy,
    @required this.source,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.articleUrl,
  });

  void _launchArticle() async{
     if(await canLaunch(articleUrl)){
          await launch(articleUrl);
     }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.purpleAccent,
      onTap: _launchArticle,
      child: GridTile(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width > 500 ? 190 : 230,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                    color: Colors.blueGrey,
                  ),
                  child: ClipRRect(
                    child: (imageUrl == null ) ? Image.asset(
                      'assets/images/news.png',
                      fit: BoxFit.cover,
                    ) : Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (author != null)
                              Text(
                                MediaQuery.of(context).size.width > 500
                                    ? author.length > 40
                                        ? author.substring(0, 40) + '...'
                                        : author
                                    : author.length > 60
                                        ? author.substring(0, 60) + '...'
                                        : author,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 500
                                          ? 13
                                          : 15,
                                ),
                              ),
                            if (publishedBy != null)
                              Text(
                                DateFormat.yMMMd()
                                    .format(DateTime.parse(publishedBy)),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 500
                                          ? 13
                                          : 15,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (source != null)
                        Expanded(
                          child: Text(
                            source,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width > 500
                                  ? 13
                                  : 15,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      MediaQuery.of(context).size.width > 500
                          ? title.length > 110
                              ? title.substring(0, 110) + '...'
                              : title
                          : title.length > 140
                              ? title.substring(0, 140) + '...'
                              : title,
                      style: MediaQuery.of(context).size.width > 500
                          ? Theme.of(context).textTheme.headline6
                          : Theme.of(context).textTheme.headline5,
                    ),
                  ),
                SizedBox(
                  height: 6,
                ),
                if (description != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      MediaQuery.of(context).size.width > 500
                          ? description.length > 100
                              ? description.substring(0, 100) + '...'
                              : description
                          : description.length > 120
                              ? description.substring(0, 120) + '...'
                              : description,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
