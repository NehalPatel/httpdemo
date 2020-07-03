import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:httpdemo/http_service.dart';

import 'post_model.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  final HttpService httpservice = HttpService();

  PostDetails({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post Details"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () async {
            await httpservice.deletePost(post.id);
            Navigator.of(context).pop();
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Title"),
                    subtitle: Text(post.title),
                  ),
                  ListTile(
                    title: Text("ID"),
                    subtitle: Text(post.id.toString()),
                  ),
                  ListTile(
                    title: Text("Body"),
                    subtitle: Text(post.body),
                  ),
                  ListTile(
                    title: Text("User ID"),
                    subtitle: Text(post.userId.toString()),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
