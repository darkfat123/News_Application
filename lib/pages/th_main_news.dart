import 'package:flutter/material.dart';
import 'package:news_application/models/news_page.dart';
import 'package:news_application/widgets/build_tab.dart';
import 'package:news_application/widgets/gradient_text.dart';

class THMainNews extends StatelessWidget {
  const THMainNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: GradientText(
            'ข่าวไทย',
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
                BuildTab(text: 'โดดเด่น'),
                BuildTab(text: "เทคโนโลยี"),
                BuildTab(text: "สุขภาพ"),
                BuildTab(text: "ธุรกิจ"),
                BuildTab(text: "บันเทิง"),
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
                    country: 'th',
                    category: 'no-category',
                  ),
                  NewsWidget(
                    country: 'th',
                    category: 'technology',
                  ),
                  // Widgets for "Health" tab
                  NewsWidget(
                    country: 'th',
                    category: 'health',
                  ),

                  // Widgets for "Business" tab
                  NewsWidget(
                    country: 'th',
                    category: 'business',
                  ),

                  // Widgets for "Entertainment" tab
                  NewsWidget(
                    country: 'th',
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
