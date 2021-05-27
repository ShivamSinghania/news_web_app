import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/news_model.dart';

const apiKey = '3a95252c09a144ab9d98c34ddc36eda8';
const newsURL = 'https://newsapi.org/v2/top-headlines';

class NewsAPI {
  NewsAPI(this.page);
  int page;

  Future<List<NewsModel>> getListOfNewsModel() async {
    final String url = '$newsURL?country=in&pageSize=9&page=$page';
    print('fetching page $page');
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {HttpHeaders.authorizationHeader: 'Basic $apiKey'},
    );
    return compute(_parse, response);
  }

  List<NewsModel> _parse(http.Response response) {
    List articles;
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['status'] == 'ok') {
        articles = json['articles'];
      } else {
        throw Exception('API Error : ${json['code']}');
      }
    } else {
      throw Exception('HTTP Error : ${response.statusCode}');
    }

    return articles.map((article) => NewsModel.fromJson(article)).toList();
  }
}
