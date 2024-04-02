import 'package:flutter/material.dart';
import 'package:news_application/main.dart';
import 'package:news_application/models/for_carousel.dart';
import 'package:news_application/models/news_home_widget.dart';
import 'package:news_application/widgets/build_tab.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: TextField(
                        controller: _searchController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Color(0xFFFF3A44),
                            ),
                          ),
                          suffixIcon: Icon(Icons.search_outlined, size: 24),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 30),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFFF3A44), Color(0xFFFF8086)],
                        ),
                      ),
                      child: const Icon(
                        Icons.notifications_none_outlined,
                        size: 24,
                        color: Colors.white,
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Lastest Top News",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      child: const Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 20,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(
                                initialIndex:
                                    2), // Assuming USDetailPage is defined
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Carousel(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                // Added Container with height constraint
                height: MediaQuery.of(context).size.height *
                    0.6, // You can adjust the height as needed
                child: const DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          BuildTab(text: "Technology"),
                          BuildTab(text: "Health"),
                          BuildTab(text: "Business"),
                          BuildTab(text: "Entertainment"),
                        ],
                        isScrollable: true,
                        indicator: BoxDecoration(),
                        dividerHeight: 0,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Widgets for "Top" tab
                            NewsHomeWidget(
                              country: 'us',
                              category: 'technology',
                            ),
                            // Widgets for "Health" tab
                            NewsHomeWidget(
                              country: 'us',
                              category: 'health',
                            ),

                            // Widgets for "Business" tab
                            NewsHomeWidget(
                              country: 'us',
                              category: 'business',
                            ),

                            // Widgets for "Entertainment" tab
                            NewsHomeWidget(
                              country: 'us',
                              category: 'entertainment',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
