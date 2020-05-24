import 'dart:convert';

import 'package:fresh_news/models/newsArticle.dart';
import 'package:fresh_news/utils/constants.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    final url = Constants.headlinesFor(keyword);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    } else {
      throw Exception('Faild to get news');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url = Constants.TOP_HEADLINES_URL;

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Failed to get top news');
    }
  }
}
