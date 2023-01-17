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
      home: ScalePage(title: '缩放组件'),
    );
  }
}

class ScalePage extends StatefulWidget {
  ScalePage({required this.title});

  final String title;

  @override
  _ScalePageState createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> {

  double _scaleSize = 100.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        child: FlutterLogo(
          size: _scaleSize,
        ),
        onScaleUpdate: (e){
          setState((){
            _scaleSize = 300 * e.scale.clamp(0.5, 10);
          });
        },
      ),
    );
  }


}