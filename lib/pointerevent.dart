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
      home: PointerEventPage(title: '原始指针事件'),
    );
  }
}

class PointerEventPage extends StatefulWidget{
  final String title;

  PointerEventPage({required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PointerEventPageState();
  }
}

class _PointerEventPageState extends State<PointerEventPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
     body: Center(
       child: Listener(
         child: IgnorePointer(
           ignoring: true,
           child: Listener(
             child: Container(
               width: 200,
               height: 200,
               color: Colors.greenAccent,
             ),
             onPointerDown: (PointerDownEvent event) => print("Listener2"),
           ),
         ),
         onPointerDown: (PointerDownEvent event) => print("Listener1"),
       ),
     ),
   );
  }
}














