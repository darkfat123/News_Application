import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NewsService {
  List<Map<String, dynamic>> news_data = [];
  String? key = dotenv.env['key'];

  Future<List<Map<String, dynamic>>> fetchNews() async {
    print(key);
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=${key}'));

    if (response.statusCode == 200) {
      final dynamic decodedData = json.decode(utf8.decode(response.bodyBytes));
      if (decodedData is Map<String, dynamic>) {
        news_data.add(decodedData);

        // Check if 'articles' key exists
        if (decodedData.containsKey('articles')) {
          List<Map<String, dynamic>> articles =
              List<Map<String, dynamic>>.from(decodedData['articles']);

          // Filter articles where 'urlToImage' is not null
          articles = articles
              .where((article) =>
                  article.containsKey('urlToImage') &&
                  article['urlToImage'] != null)
              .toList();

          for (Map<String, dynamic> article in articles) {
            print(article['urlToImage']);
          }

          return articles;
        } else {
          throw Exception('Key "articles" not found in data');
        }
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to load news');
    }
  }
}
