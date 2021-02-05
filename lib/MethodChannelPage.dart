import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelPage extends StatefulWidget {
  MethodChannelPage({Key key}) : super(key: key);

  @override
  _MethodChannelPageState createState() => _MethodChannelPageState();
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  var _data;

  int _counter = 30;

  var channel = MethodChannel('com.zhou.MethodChannel');

  Future<void> _incrementCounter() async {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    var result = await channel
        .invokeMethod('flutterSendData', {'name': 'zhou', 'age': _counter});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("MethodChannel"),
      ),
      body: Column(
        children: [
          Text("Flutter发送的数据："),
          Text('$_counter'),
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text(
              '发送数据',
              style: TextStyle(fontSize: 28.0),
            ),
          ),
        ],
      ),
    );
  }
}
