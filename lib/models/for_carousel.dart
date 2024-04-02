import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_application/models/news_api.dart';

class Carousel extends StatefulWidget {

  const Carousel({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late Future<List<Map<String, dynamic>>> articles;

  @override
  void initState() {
    super.initState();
    NewsService newsService = NewsService();
    articles = newsService.fetchNews('us', 'no-category');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // You can return a loading indicator or placeholder here
          return const Center(child: SizedBox(height: 200,));
        } else if (snapshot.hasError) {
          // Handle error state
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Handle empty data state
          return const Text('No data available');
        } else {
          final List<Map<String, dynamic>> articles = snapshot.data!;

          final List<String> imgList = articles
              .map((article) => article['urlToImage'].toString())
              .take(5)
              .toList();

          final List<String> sourceTitle = articles
              .map((article) => article['title'].toString())
              .take(5)
              .toList();

          final List<String> sourceName = articles
              .map((article) => article['source']['name'].toString())
              .take(5)
              .toList();

          final List<Widget> imageSliders =
              imgList.asMap().entries.map((entry) {
            final int index = entry.key;
            final String imageUrl = entry.value;
            final String title = sourceTitle[index];
            final String name = sourceName[index];
            return Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList();

          return CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 5),
              initialPage: 0,
              autoPlay: true,
            ),
            items: imageSliders,
          );
        }
      },
    );
  }
}
