import 'package:flutter/material.dart';
import 'package:news_application/models/news_api.dart';

class USnewsPage extends StatelessWidget {
  final NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('ข่าวต่างประเทศ')),
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
                                fit: BoxFit.fill,
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          newsItem['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          newsItem['description'],
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                newsItem['author'] == null ? Text(
                                  "Author: " + newsItem['author'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ) : SizedBox.shrink(),
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
                              onTap: () {},
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
                                  "Read more",
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
      ),
    );
  }
}
