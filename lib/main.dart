import 'package:flutter/material.dart';
import 'package:flutter_basics/demo/listview_demo.dart';
import 'package:flutter_basics/demo/bottom_navigation_bar_demo.dart';
import 'package:flutter_basics/demo/basic_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.yellow,
            highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
            splashColor: Colors.white70),
        home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListViewDemo(),
              BasicDemo(),
              // Icon(
              //   Icons.change_history,
              //   size: 128.0,
              //   color: Colors.black12,
              // ),
              Icon(
                Icons.directions_bike,
                size: 128.0,
                color: Colors.black12,
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('chaoge',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  accountEmail: Text('13260094140@163.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://i0.hdslb.com/bfs/face/452cef1ba6dd594d4c11ac19a633e747bed93acd.jpg@52w_52h.webp'),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.yellow[400],
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://ww1.sinaimg.cn/large/663d3650gy1fplwwcynw2j20p00b4js9.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.yellow[400].withOpacity(0.6),
                              BlendMode.hardLight))),
                ),
                ListTile(
                  title: Text(
                    'Messages',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(
                    Icons.message,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text(
                    'Favorite',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(
                    Icons.favorite,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(
                    Icons.settings,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBarDemo()),
    );
  }
}
