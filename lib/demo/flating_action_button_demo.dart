import 'package:flutter/material.dart';

class FlatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black26,
    // shape: BeveledRectangleBorder(
    //   borderRadius: BorderRadius.circular(10.0)
    // ),
  );

  // final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
  //   onPressed: () {},
  //   icon: Icon(Icons.add),
  //   label: Text('add'),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
