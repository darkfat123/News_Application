import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApiService {
  final String apiKey = "2a062b05d3424b8ea2bfc6d1eb328133";
  final String baseUrl = "https://newsapi.org/v2/top-headlines";

  final _newsStreamController = StreamController<List<Map<String, dynamic>>>();

  Stream<List<Map<String, dynamic>>> get newsStream => _newsStreamController.stream;

  Future<void> fetchNews() async {
    const String country = "us";
    const String category = "business";

    final String apiUrl = "$baseUrl?country=$country&category=$category&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('articles')) {
          final List<dynamic> articles = data['articles'];
          final List<Map<String, dynamic>> formattedArticles = List<Map<String, dynamic>>.from(articles);
          _newsStreamController.add(formattedArticles);
        } else {
          throw Exception('Invalid API response format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  void dispose() {
    _newsStreamController.close();
  }
}
