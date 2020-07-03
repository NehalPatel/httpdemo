import 'package:flutter/material.dart';
import 'package:httpdemo/http_service.dart';
import 'package:httpdemo/post_model.dart';

import 'post_details.dart';

class PostPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;

              return ListView.separated(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      posts[index].title,
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                    ),
                    leading: Text(
                      posts[index].id.toString(),
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PostDetails(post: posts[index]),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
