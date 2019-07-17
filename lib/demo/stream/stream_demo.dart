import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StreamDemo'),
          elevation: 0.0,
        ),
        body: StreamDemoHome());
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _streamSink;
  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print('create a stream.');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamDemo = StreamController<String>();
    _streamDemo = StreamController.broadcast();
    _streamSink = _streamDemo.sink;

    print('start listening on a stream');
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamSubscription =
        _streamDemo.stream.listen(onDataTo, onError: onError, onDone: onDone);
    print('initialize completed.');
  }

  void onData(String data) {
    setState(() {
     _data = data; 
    });
    print('$data');
  }

  void onDataTo(String data) {
    print('onDataTo:$data');
  }

  void onError(error) {
    print('error:$error');
  }

  void onDone() {
    print('Done!');
  }

  void _pauseStream() {
    print('pause subscription');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('resume subscription');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('cancel subscription');
    _streamSubscription.cancel();
  }

  void _addDataToStream() async {
    print('add data to stream');
    String data = await fetchData();
    // _streamDemo.add(data);
    _streamSink.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'Something happened';
    return 'hello.';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(_data),
          StreamBuilder(
            stream: _streamDemo.stream,
            initialData: '...',
            builder: (context,snapshot){
              return Text('${snapshot.data}');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('add'),
                onPressed: _addDataToStream,
              ),
              FlatButton(
                child: Text('暂停'),
                onPressed: _pauseStream,
              ),
              FlatButton(
                child: Text('恢复'),
                onPressed: _resumeStream,
              ),
              FlatButton(
                child: Text('取消'),
                onPressed: _cancelStream,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
