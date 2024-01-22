import 'package:flutter/material.dart';
import 'package:news_application/models/news_api.dart';

class USnewsPage extends StatelessWidget {
  final NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ข่าวต่างประเทศ'),
        ),
        body: FutureBuilder(
          future: newsService.fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<dynamic> news = snapshot.data as List<dynamic>;
              return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  final newsItem = news[index];
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 4)),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      child: Column(children: [
                        Image.network(newsItem['urlToImage'].toString()),
                        SizedBox(
                          height: 10,
                        ),
                        Text(newsItem['title']),
                        SizedBox(
                          height: 10,
                        ),
                        Text(newsItem['description']),
                        Row(
                          children: [Text(newsItem['source']['name'])],
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
