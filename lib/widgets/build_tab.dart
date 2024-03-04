import 'package:flutter/material.dart';

class BuildTab extends StatelessWidget {
  final String text;
  const BuildTab({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          gradient: const LinearGradient(
            colors: [Color(0xFFFF3A44), Color(0xFFFF8086)],
          ),
          borderRadius:
              const BorderRadius.all(Radius.circular(20)), // Set the border radius
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
