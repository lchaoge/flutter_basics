import 'package:flutter/material.dart';
import 'package:flutter_basics/demo/listview_demo.dart';
import 'package:flutter_basics/demo/bottom_navigation_bar_demo.dart';
import 'package:flutter_basics/demo/basic_demo.dart';
import 'package:flutter_basics/demo/drawer_demo.dart';
import 'package:flutter_basics/demo/layout_demo.dart';
import 'package:flutter_basics/demo/view_demo.dart';
import 'package:flutter_basics/demo/sliver_demo.dart';
import 'package:flutter_basics/demo/navigator_demo.dart';
import 'package:flutter_basics/demo/form_demo.dart';
import 'package:flutter_basics/demo/material_components.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0),
        ),
      // home: NavigatorDemo(),
      initialRoute: '/mdc',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => Page(
              title: 'about',
            ),
        '/form':(context)=>FormDemo(),
        '/mdc':(context)=>MaterialComponents(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            // leading: IconButton(
            //     icon: Icon(Icons.menu),
            //     tooltip: 'navigration',
            //     onPressed: () => debugPrint('navigration button is pressed.')),
            title: Text('chaoge'),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'search',
                  onPressed: () => debugPrint('search button is pressed.')),
            ],
            elevation: 0.0,
            bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.local_florist),
                ),
                Tab(
                  icon: Icon(Icons.change_history),
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                ),
                Tab(
                  icon: Icon(Icons.view_quilt),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListViewDemo(),
              BasicDemo(),
              LayoutDemo(),
              SliverDemo(),
            ],
          ),
          drawer: DrawerDemo(),
          bottomNavigationBar: BottomNavigationBarDemo()),
    );
  }
}
