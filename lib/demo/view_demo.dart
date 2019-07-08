import 'package:flutter/material.dart';
import 'package:flutter_basics/model/post.dart';

class ViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  
  Widget _gridItemBuilder(BuildContext centext,int index){
    return Container(
      child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTitles(int length){
    return List.generate(length, (int index){
      return Container(
          color: Colors.grey[300],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'Item_$index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150.0, // 最大宽度
      crossAxisSpacing: 1.0,
      mainAxisSpacing: 1.0,
      scrollDirection: Axis.vertical,   // 水平or垂直
      children: _buildTitles(100)
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTitles(int length){
    return List.generate(length, (int index){
      return Container(
          color: Colors.grey[300],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'Item_$index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 1.0,
      mainAxisSpacing: 1.0,
      scrollDirection: Axis.horizontal,   // 水平or垂直
      children: _buildTitles(100)
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                posts[index].author,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false, // 滑动显示一整页
      // reverse: true, // 翻转
      scrollDirection: Axis.vertical, // 横向竖向
      onPageChanged: (currentPage) => {debugPrint('Page:$currentPage')},
      controller: PageController(
        initialPage: 1, // 默认页
        keepPage: false, // 缓存
        viewportFraction: 0.95, // 页面比例
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'one',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.green[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'two',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'three',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
