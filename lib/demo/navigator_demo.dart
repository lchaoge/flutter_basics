import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('home'),
              onPressed: null,
            ),
            FlatButton(
              child: Text('about'),
              onPressed: (){
                Navigator.pushNamed(context, '/about');
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => Page(title: 'about',)
                //   )
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {

  final String title;

  Page({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}