import 'package:flutter/material.dart';
import 'package:flutter_chapter5/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: GestureDetectorPage(title: '原始指针事件'),
    );
  }
}

class GestureDetectorPage extends StatefulWidget{
  final String title;

  GestureDetectorPage({required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GestureDetectorPageState();
  }
}

class _GestureDetectorPageState extends State<GestureDetectorPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.greenAccent,
            child: Text('我是一个画布'),
          ),
          onTap: () => print('onTap'),
          onTapDown: (e) => print('onTapDown'),
          onTapUp: (e) => print('onTapUp'),
          onTapCancel: () => print('onTapCancel'),
          onDoubleTap: () => print('onDoubleTap'),
          onVerticalDragStart: (e) => print('onVerticalDragStart'),
          onVerticalDragUpdate: (e)=>print('onVerticalDragUpdate'),
          onVerticalDragDown: (e) => print('onVerticalDragDown'),
          onVerticalDragEnd: (e) => print('onVerticalDragEnd'),
          onVerticalDragCancel: () => print('onVerticalDragCancel'),
          onHorizontalDragStart: (e) => print('onHorizontalDragStart'),
          onHorizontalDragUpdate: (e)=>print('onHorizontalDragUpdate'),
          onHorizontalDragDown: (e) => print('onHorizontalDragDown'),
          onHorizontalDragEnd: (e) => print('onHorizontalDragEnd'),
          onHorizontalDragCancel: () => print('onHorizontalDragCancel'),
          onLongPress: () => print('onLongPress'),

        ),
      ),
    );
  }
}











