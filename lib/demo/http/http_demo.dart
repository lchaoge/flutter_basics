import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {

  @override
    void initState() {
      super.initState();
      // fetchPosts().then((value){});


    }
    
    Future<List<Post>> fetchPosts() async{
      final response = await http.get('https://resources.ninghao.net/demo/posts.json');
      if(response.statusCode == 200){
        final responseBody = json.decode(response.body);
        List<Post> posts = responseBody['posts'].map<Post>((item)=>Post.formJson(item)).toList();
        return posts;
      }else{
        throw Exception('faild to fetch posts');
      }

    }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text('loading...'),
          );
        }else{
          return ListView(
            children: snapshot.data.map<Widget>((item){
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}

class Post{
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;
  Post({
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl
  });

  Post.formJson(Map json):
    id = json['id'],
    title = json['title'],
    description = json['description'],
    author = json['author'],
    imageUrl = json['imageUrl'];
  
  Map toJson()=>{
    'id': id,
    'title': title,
    'description': description,
    'author': author,
    'imageUrl': imageUrl
  };

}