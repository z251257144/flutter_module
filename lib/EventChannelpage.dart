import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelPage extends StatefulWidget {
  EventChannelPage({Key key}) : super(key: key);

  @override
  _EventChannelPageState createState() => _EventChannelPageState();
}

class _EventChannelPageState extends State<EventChannelPage> {
  var _eventChannel = EventChannel('com.zhou.EventChannel');

  var _counter = 1;

  _incrementCounter() {
    setState(() {
      _counter++;
    });

    var result = await channel
        .invokeMethod('flutterSendData', {'name': 'zhou', 'age': _counter});
    print("Flutter 收到了返回数据");
    print(result);
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
          Text("Flutter EventChannel 发送的数据："),
          Text('$_counter'),
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text(
              '发送数据',
              style: TextStyle(fontSize: 28.0),
            ),
          ),
          Text("Native发送的数据："),
          Text('$_nativeData'),
        ],
      ),
    );
  }
}
