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
          padding: EdgeInsets.symmetric(vertical:24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("หน้าหลัก",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              IconButton(
                icon: Icon(Icons.menu_rounded,size: 30,),
                onPressed: () {
                  print("Icon had pressed!");
                },
              )
            ],
          ),
        ),
      ),
      body: Column(children: []),
    );
  }
}
