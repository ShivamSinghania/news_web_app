import 'package:flutter/material.dart';
import 'news_card.dart';
import '../models/news_model.dart';
import 'package:breakpoint/breakpoint.dart';

class NewsList extends StatelessWidget {
  final List<NewsModel> news;
  const NewsList({Key? key, required this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _breakpoint = Breakpoint.fromMediaQuery(context);
    return GridView.count(
      padding: EdgeInsets.all(_breakpoint.gutters / 2),
      childAspectRatio: 2,
      crossAxisCount: _breakpoint.columns ~/ 4,
      mainAxisSpacing: _breakpoint.gutters / 2,
      crossAxisSpacing: _breakpoint.gutters / 2,
      shrinkWrap: true,
      children: news
          .map(
            (article) => NewsCard(article: article),
          )
          .toList(),
    );
  }
}
