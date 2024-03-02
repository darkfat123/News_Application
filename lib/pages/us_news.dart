import 'package:flutter/material.dart';
import 'package:news_application/models/format.dart';
import 'package:news_application/models/news_api.dart';
import 'package:news_application/pages/us_news_detail.dart';
import 'package:news_application/widgets/gradient_text.dart';

class USnewsPage extends StatelessWidget {
  final NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Center(
            child: GradientText(
              'ข่าวต่างประเทศ',
              style: TextStyle(fontWeight: FontWeight.bold),
              gradient: LinearGradient(
                  colors: [Color(0xFFFF3A44), Color(0xFFFF8086)]),
            ),
          ),
        ),
        body: FutureBuilder(
          future: newsService.fetchNews(),
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
                      child: Column(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AspectRatio(
                              aspectRatio: 2,
                              child: Image.network(
                                newsItem['urlToImage'].toString(),
                                fit: BoxFit.cover,
                              ),
                            )),
                        const SizedBox(
                          height: 16,
                        ),
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
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          newsItem['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          newsItem['description'],
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                newsItem['author'] != null
                                    ? Text(
                                        "Author: " + newsItem['author'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      )
                                    : SizedBox.shrink(),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => USDetailPage(newsItem))
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
                                        Color(0xFFFF8086)
                                      ],
                                    )),
                                child: const Text(
                                  "อ่านเพิ่มเติม",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ]));
                },
              );
            }
          },
        ),
      );
    
  }
}
