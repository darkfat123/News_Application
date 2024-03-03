import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:news_application/pages/us_news.dart';

Future<void> main() async {
  await dotenv.load(fileName: "key.env");
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
  // ignore: no_logic_in_create_state
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Elusive.home_circled,size: 20,),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Elusive.address_book,size: 20,),
            label: 'ข่าวไทย',
          ),
          BottomNavigationBarItem(
            icon: Icon(Elusive.reddit,size: 20,),
            label: 'ข่าวต่างประเทศ',
            
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
        widget = USnewsPage();
        break;
      case 2:
        widget = USnewsPage();
        break;
      default:
        widget = USnewsPage();
        break;
    }
    return widget;
  }
}
