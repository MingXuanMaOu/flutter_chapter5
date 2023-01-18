import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  final String title;
  SecondScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Text(
          this.title,
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}