// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:news_application/methods/launcher.dart';
import 'package:news_application/models/format.dart';
import 'package:news_application/models/news_api.dart';
import 'package:news_application/pages/us_news_detail.dart';

class NewsWidget extends StatelessWidget {
  final String country;
  final String category;

  const NewsWidget({super.key, required this.country, required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsService().fetchNews(country, category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<dynamic> news = snapshot.data as List<dynamic>;
          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              final newsItem = news[index];
              return Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    country == 'th'
                        ? const SizedBox.shrink()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AspectRatio(
                              aspectRatio: 2,
                              child: Image.network(
                                newsItem['urlToImage'].toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          formatDate(newsItem['publishedAt']),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      newsItem['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    country == 'th'
                        ? const SizedBox.shrink()
                        : Text(
                            newsItem['description'],
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            newsItem['author'] != null
                                ? Text(
                                    "Author: " +
                                        (newsItem['author'].split(', ').length >
                                                2
                                            ? newsItem['author']
                                                    .split(', ')
                                                    .sublist(0, 1)
                                                    .join(', ') +
                                                " and more"
                                            : newsItem['author']),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Text(
                              "Source from: " + newsItem['source']['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            country == 'th'
                                ? launchInBrowser(
                                    Uri.parse(newsItem['url'].toString()))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => USDetailPage(
                                          newsItem), // Assuming USDetailPage is defined
                                    ),
                                  );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFFFF3A44),
                                  Color(0xFFFF8086),
                                ],
                              ),
                            ),
                            child: const Text(
                              "อ่านเพิ่มเติม",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
