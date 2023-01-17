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
      home: onPanUpdatePage(title: '拖拽组件'),
    );
  }
}

class onPanUpdatePage extends StatefulWidget {
  onPanUpdatePage({ required this.title});

  final String title;

  @override
  _onPanUpdateState createState() => _onPanUpdateState();
}

class _onPanUpdateState extends State<onPanUpdatePage> {

  double _left=0.0;
  double _top=0.0;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {  },
                  child: Text('我是一个大按钮'),
                ),
                onPanUpdate: (e){
                  setState(() {
                    _left+=e.delta.dx;
                    _top+=e.delta.dy;
                  });
                },
              ),
            ),
          ],
        )
    );
  }
}
