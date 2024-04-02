import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_application/pages/home_page.dart';
import 'package:news_application/pages/th_main_news.dart';
import 'package:news_application/pages/us_main_news.dart';

Future<void> main() async {
  //await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News_Application',
      theme: ThemeData(
        fontFamily: "IBMPlexSansThai",
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(initialIndex: 0),
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
      body: Stack(
        children: [
          getSelectedWidget(index: index),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70,
              margin:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: BottomNavigationBar(
                  currentIndex: index,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedIconTheme: const IconThemeData(color: Color(0xFFFF3A44)),
                  selectedLabelStyle: const TextStyle(color:Colors.black,fontSize: 12),
                  useLegacyColorScheme: false,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Icon(Icons.now_widgets_outlined, size: 24),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Icon(Icons.flight_land_outlined, size: 24),
                      ),
                      label: 'Thai News',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Icon(
                          Icons.public,
                          size: 24,
                        ),
                      ),
                      label: 'World News',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget =  HomePage();
        break;
      case 1:
        widget = const THMainNews();
        break;
      default:
        widget = const USMainNews();
        break;
    }
    return widget;
  }
}
