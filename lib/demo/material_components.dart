import 'package:flutter/material.dart';
import 'package:flutter_basics/demo/button_demo.dart';
import 'package:flutter_basics/demo/flating_action_button_demo.dart';
import 'package:flutter_basics/demo/popup_menu_button_demo.dart';
import 'package:flutter_basics/demo/form_demo.dart';
import 'package:flutter_basics/demo/checkbox_demo.dart';
import 'package:flutter_basics/demo/radio_demo.dart';
import 'package:flutter_basics/demo/switch_demo.dart';
import 'package:flutter_basics/demo/slider_demo.dart';
import 'package:flutter_basics/demo/datetime_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'DateTime', page: DateTimeDemo()),
          ListItem(title: 'Slider', page: SliderDemo()),
          ListItem(title: 'Switch', page: SwitchDemo()),
          ListItem(title: 'Radio', page: RadioDemo()),
          ListItem(title: 'Checkbox', page: CheckboxDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(title: 'Form', page: FormDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(
              title: 'FlatingActionButton', page: FlatingActionButtonDemo())
        ],
      ),
    );
  }
}


class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
