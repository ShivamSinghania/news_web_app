import 'package:flutter/material.dart';
import '../models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final NewsModel article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  _handleTap(BuildContext context) async {
    if (await canLaunch(article.url)) {
      await launch(article.url);
    } else {
      final snackBar = SnackBar(content: Text('Could not launch website'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context),
      child: Card(
        child: Container(
          padding: EdgeInsets.only(left: 4),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        article.sourceName,
                        style: Theme.of(context).textTheme.overline,
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                          text: article.title,
                          style: Theme.of(context).textTheme.headline6,
                          children: [
                            TextSpan(
                              text: '\n\n' + article.description,
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        DateTime.parse(article.publishedAt)
                            .toString()
                            .substring(0, 16),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
