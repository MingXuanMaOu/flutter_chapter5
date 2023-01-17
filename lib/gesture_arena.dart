import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestureArenaPage(title: '手势竞技场'),
    );
  }
}

class GestureArenaPage extends StatefulWidget {
  GestureArenaPage({required this.title});

  final String title;

  @override
  _GestureArenaState createState() => _GestureArenaState();
}

class _GestureArenaState extends State<GestureArenaPage>{
  double _left = 0.0;
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned(
            left: _left,
            top: _top,
            child: GestureDetector(
              child: OutlinedButton(
                child: Text('我是一个按钮'),
                onPressed: (){},
              ),
              onHorizontalDragUpdate: (e){
                setState((){
                  _left += e.delta.dx;
                  print('水平事件胜出');
                });
              },
              onVerticalDragUpdate: (e){
                setState((){
                  _top += e.delta.dy;
                  print('垂直事件胜出');
                });
              },
              onHorizontalDragEnd: (e){
                print('水平移动结束');
              },
              onVerticalDragEnd: (e){
                print('垂直移动结束');
              },
              onTapDown: (e){
                print('按下');
              },
              onTapUp: (e){
                print('抬起');
              },
            ),
          )
        ],
      ),
    );
  }
}








