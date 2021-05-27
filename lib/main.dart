import 'package:flutter/material.dart';
import 'helpers/news_api.dart';
import 'widgets/news_list.dart';
import 'models/news_model.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: Scaffold(
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, listIndex) {
            return NewsPage(pageIndex: listIndex + 1);
          },
        ),
      ),
    );
  }
}

class NewsPage extends StatefulWidget {
  final int pageIndex;
  NewsPage({required this.pageIndex});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsAPI newsAPI;

  @override
  void initState() {
    super.initState();
    newsAPI = NewsAPI(widget.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: newsAPI.getListOfNewsModel(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? NewsList(news: snapshot.data!)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
