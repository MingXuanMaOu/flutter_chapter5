import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_chapter5/gesture_arena.dart';
import 'package:flutter_chapter5/pagetwo.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ScrollNotificationPage(title: '事件通知'),
    );
  }
}

class ScrollNotificationPage extends StatefulWidget{
  final String title;

  ScrollNotificationPage({required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScrollNotificationState();
  }
}

class _ScrollNotificationState extends State<ScrollNotificationPage>{
  String _message = "我是通知";
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  showNotification() async{
    var android = new AndroidNotificationDetails('channel id', 'channel Name',
    priority: Priority.high,importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android,iOS: iOS);
    await flutterLocalNotificationsPlugin.show(0, '我的通知', '通知内容', platform,payload: '通知界面');
  }

  Future onSelectNotification(String payload) async{
    await Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondScreen(title: payload)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launch');
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings();
    flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  void _onScrollStart(ScrollMetrics scrollMetrics){
    setState((){
      this._message = "滚动开始";
    });
  }

  void _onScrollEnd(ScrollMetrics scrollMetrics){
    setState((){
      this._message = "滚动结束";
    });
  }

  void _onScrollUpdate(ScrollMetrics scrollMetrics){
    setState((){
      showNotification();
      print('测试');
      FlutterAppBadger.updateBadgeCount(10);
      this._message = "滚动进行时";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.greenAccent,
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(this._message),
            ),
          ),
          Expanded(
              child: NotificationListener<ScrollNotification>(
                child: ListView.builder(itemBuilder: (BuildContext,index){
                  return ListTile(title: Text("第$index行"),);
                },
                  itemCount: 30,
                ),
                onNotification: (scrollNotification){
                  if(scrollNotification is ScrollStartNotification){
                    this._onScrollStart(scrollNotification.metrics);
                  }else if(scrollNotification is ScrollUpdateNotification){
                    this._onScrollUpdate(scrollNotification.metrics);
                  }else if(scrollNotification is ScrollEndNotification){
                    this._onScrollEnd(scrollNotification.metrics);
                  }
                  return true;
                },
              ))
        ],
      ),
    );
  }

}























