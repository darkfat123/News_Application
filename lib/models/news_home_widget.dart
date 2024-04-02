// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:news_application/models/format.dart';
import 'package:news_application/models/news_api.dart';

class NewsHomeWidget extends StatelessWidget {
  final String country;
  final String category;

  const NewsHomeWidget(
      {super.key, required this.country, required this.category});

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
            itemCount: news.length > 5 ? 5 : news.length,
            itemBuilder: (context, index) {
              final newsItem = news[index];
              return Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (country == 'th')
                      const SizedBox.shrink()
                    else
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: Opacity(
                                  opacity: 0.95,
                                  child: Image.network(
                                    newsItem['urlToImage'].toString(),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Positioned(
                              top: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      newsItem['title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4.0, // shadow blur
                                            color: Colors.black, // shadow color
                                            offset: Offset(2.0,
                                                2.0), // how much shadow will be shown
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      newsItem['author'] ?? newsItem['source']['name'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4.0, // shadow blur
                                            color: Colors.black, // shadow color
                                            offset: Offset(2.0,
                                                2.0), // how much shadow will be shown
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      formatDate(newsItem['publishedAt']),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4.0, // shadow blur
                                            color: Colors.black, // shadow color
                                            offset: Offset(2.0,
                                                2.0), // how much shadow will be shown
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
