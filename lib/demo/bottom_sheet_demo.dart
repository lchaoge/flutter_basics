import 'package:flutter/material.dart';
import 'dart:async';


class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheet(){
    _bottomSheetScaffoldKey.currentState.showBottomSheet(
      (BuildContext context){
        return BottomAppBar(
          child: Container(
            width: double.infinity,
            height: 90.0,
            child: Row(
              children: <Widget>[
                Icon(Icons.pause_circle_outline),
                SizedBox(width: 16.0,),
                Text('01:30/02:30'),
                Expanded(
                  child: Text('fix you - coldpaly',textAlign:TextAlign.right),
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Future _openModalBottomSheet() async{
    final option = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('option a'),
                onTap: (){
                  Navigator.pop(context,'a');
                },
              ),
              ListTile(
                title: Text('option b'),
                onTap: (){
                  Navigator.pop(context,'b');
                },
              ),
              ListTile(
                title: Text('option c'),
                onTap: (){
                  Navigator.pop(context,'c');
                },
              ),
            ],
          ),
        );
      }
    );
    print(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
          key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('oper bottomsheet'),
                  onPressed: _openBottomSheet
                ),
                FlatButton(
                  child: Text('modal bottomsheet'),
                  onPressed: _openModalBottomSheet
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
