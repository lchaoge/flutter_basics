import 'package:flutter/material.dart';
import 'dart:async';

enum Action { OK, Cance }

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';

  Future _operAlertDialog() async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('alertdialog'),
            content: Text('are you sure about this?'),
            actions: <Widget>[
              FlatButton(
                child: Text('cancel'),
                onPressed: () {
                  Navigator.pop(context, Action.Cance);
                },
              ),
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.pop(context, Action.OK);
                },
              ),
            ],
          );
        });

    switch (action) {
      case Action.OK:
        setState(() {
          _choice = "OK";
        });
        break;
        case Action.Cance:
        setState(() {
          _choice = "Cance";
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('your  choice is : $_choice'),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('oper alertDialog'),
                    onPressed: _operAlertDialog)
              ],
            )
          ],
        ),
      ),
    ));
  }
}
