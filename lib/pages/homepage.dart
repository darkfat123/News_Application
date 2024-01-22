import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "หน้าหลัก",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  size: 30,
                ),
                onPressed: () {
                  print("Icon had pressed!");
                },
              )
            ],
          ),
        ),
      ),
      body: Column(children: [
        Image.network(
            "https://nbcsports.brightspotcdn.com/dims4/default/6883370/2147483647/strip/true/crop/3872x2178+0+202/resize/1440x810!/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.us-east-1.amazonaws.com%2Fbrightspot%2F9b%2Fa1%2F67f6cf4f445d998176e9a47077d4%2Fhttps-api-imagn.com%2Frest%2Fdownload%2FimageID%3D21977785")
      ]),
    );
  }
}
