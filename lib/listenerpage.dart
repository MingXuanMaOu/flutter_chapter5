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
      home: ListenerPage(title: '原始指针事件'),
    );
  }
}

class ListenerPage extends StatefulWidget{
  final String title;
  
  ListenerPage({required this.title});
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListenerPageState();
  }
}

class _ListenerPageState extends State<ListenerPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Listener(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.greenAccent,
            child: Text(widget.title,style: TextStyle(fontSize: 32),),
          ),
          onPointerDown: (PointerDownEvent event) => print('onPointDown'),
          onPointerMove: (PointerMoveEvent event) => print('onPointerMove'),
          onPointerUp: (PointerUpEvent event) => print('onPointerUp'),
          onPointerCancel: (PointerCancelEvent event) => print('onPointerCancel'),
        ),
      ),
    );
  }
}