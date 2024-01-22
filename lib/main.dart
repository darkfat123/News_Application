import 'package:flutter/material.dart';
import 'package:news_application/pages/homepage.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:news_application/pages/us_news.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "IBMPlexSansThai",
      ),
      home: const Home(initialIndex: 2),
    );
  }
}

class Home extends StatefulWidget {
  final int initialIndex;
  const Home({super.key, required this.initialIndex});

  @override
  HomeState createState() => HomeState(initialIndex: initialIndex);
}

class HomeState extends State<Home> {
  int index = 0;
  HomeState({required int initialIndex}) {
    index = initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        backgroundColor: Colors.black,
        itemPadding: EdgeInsets.symmetric(horizontal:24,vertical: 16),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Elusive.home_circled,size: 30,),
            title: Text('หน้าหลัก'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Elusive.address_book,size: 30,),
            title: Text('หน้าหลัก'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Elusive.reddit,size: 30,),
            title: Text('หน้าหลัก'),
            
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
        widget = USnewsPage();
        break;
      default:
        widget = Homepage();
        break;
    }
    return widget;
  }
}
