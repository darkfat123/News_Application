import 'package:flutter/material.dart';
import 'package:news_application/models/news_api.dart';

class USnewsPage extends StatefulWidget {
  @override
  _USnewsPageState createState() => _USnewsPageState();
}

class _USnewsPageState extends State<USnewsPage> {
  final NewsApiService _newsApiService = NewsApiService();

  @override
  void initState() {
    super.initState();
    _newsApiService.fetchNews();
  }

  @override
  void dispose() {
    _newsApiService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('US News App'),
      ),
      body: StreamBuilder(
        stream: _newsApiService.newsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            List<Map<String, dynamic>> newsData =
                snapshot.data as List<Map<String, dynamic>>;
            // Display your news data here using a ListView or other widgets
            return ListView.builder(
              itemCount: newsData.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1)),
                  child: ListTile(
                    leading: Image.network(newsData[index]['urlToImage'].toString(),width: 50,height: 50,fit: BoxFit.cover,),
                    title: Text(newsData[index]['title'] ?? ''),
                    subtitle: Column(
                      children: [
                        Text(newsData[index]['description'] ?? ''),
                        Text(newsData[index]['author'] ?? ''),
                        Text(newsData[index]['publishedAt'] ?? ''),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
