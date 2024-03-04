import 'package:flutter/material.dart';
import 'package:news_application/models/news_page.dart';
import 'package:news_application/widgets/build_tab.dart';
import 'package:news_application/widgets/gradient_text.dart';

class USMainNews extends StatelessWidget {
  const USMainNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: GradientText(
            'ข่าวต่างประเทศ',
            style: TextStyle(fontWeight: FontWeight.bold),
            gradient:
                LinearGradient(colors: [Color(0xFFFF3A44), Color(0xFFFF8086)]),
          ),
        ),
      ),
      body: const DefaultTabController(
        length: 5,
        child: Column(
          children: [
            TabBar(
              tabs: [
                BuildTab(text: 'Top'),
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
                  NewsWidget(
                    country: 'us',
                    category: 'no-category',
                  ),
                  NewsWidget(
                    country: 'us',
                    category: 'technology',
                  ),
                  // Widgets for "Health" tab
                  NewsWidget(
                    country: 'us',
                    category: 'health',
                  ),

                  // Widgets for "Business" tab
                  NewsWidget(
                    country: 'us',
                    category: 'business',
                  ),

                  // Widgets for "Entertainment" tab
                  NewsWidget(
                    country: 'us',
                    category: 'entertainment',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
