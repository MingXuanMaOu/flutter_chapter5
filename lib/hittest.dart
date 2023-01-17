import 'package:flutter/material.dart';
import 'package:flutter_chapter5/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'FLutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HitTestPage(title: '原始指针事件'),
    );
  }
}

class HitTestPage extends StatefulWidget{
  final String title;
  HitTestPage({required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HitTestPageState();
  }
}

class _HitTestPageState extends State<HitTestPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Listener(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(300.0,150.0)),
          child: Center(child: Text("Box A"),),
        ),
        behavior: HitTestBehavior.translucent,
        onPointerDown: (event) => print("down A"),
      ),
    );
  }
}













