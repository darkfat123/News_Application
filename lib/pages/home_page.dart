import 'package:flutter/material.dart';
import 'package:news_application/widgets/gradient_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: GradientText(
            'หน้าหลัก',
            style: TextStyle(fontWeight: FontWeight.bold),
            gradient:
                LinearGradient(colors: [Color(0xFFFF3A44), Color(0xFFFF8086)]),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("ข่าวใหม่")])),
    );
  }
}
