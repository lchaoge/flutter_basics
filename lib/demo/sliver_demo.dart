import 'package:flutter/material.dart';
import 'package:flutter_basics/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('chaoge'),
            pinned: true, // 固定
            floating: true, // 向上滚动隐藏，向下滚动显示
            expandedHeight: 178.0, // 伸展高度
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'chaoge decs'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1563185445&di=0dcc73e3b491f279e4ffdee1f4618f9b&imgtype=jpg&src=http%3A%2F%2Fimg6.bdstatic.com%2Fimg%2Fimage%2Fpublic%2Fjiangsheng_yasuo1518080506.jpg',
                  fit: BoxFit.cover),
            ),
          ),
          SliverSafeArea(
              sliver: SliverPadding(
            padding: EdgeInsets.all(5.0),
            sliver: SliverGridDemo(),
          ))
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: 32.0,
          ),
          child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(posts[index].title,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                        Text(posts[index].author,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white)),
                      ],
                    ),
                  )
                ],
              )),
        );
      }, childCount: posts.length),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        );
      }, childCount: posts.length),
    );
  }
}
