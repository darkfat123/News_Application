import 'package:flutter/material.dart';
import 'package:news_application/pages/homepage.dart';
import 'package:icons_flutter/icons_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News_Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(initialIndex: 1),
    );
  }
}

class Home extends StatefulWidget {
  final int initialIndex;
  const Home({super.key, required this.initialIndex});

  @override
  HomeState createState() =>
      HomeState(initialIndex: initialIndex);
}

class HomeState extends State<Home> {
  int index = 0;
  HomeState({required int initialIndex}) {
    index = initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212436),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        backgroundColor: const Color(0xFF212436),
        type: BottomNavigationBarType.fixed, // Set the type to fixed
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Elusive.home_circled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Elusive.accessibility),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Elusive.reddit),
            label: 'Trade',
          ),
        ],
        selectedItemColor: Colors.white, // Color of the selected label
        unselectedItemColor: Colors.grey,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {

      case 1:
        widget = Homepage();
        break;
      case 2:
        widget = Homepage();
        break;
      default:
        widget = Homepage();
        break;
    }
    return widget;
  }
}