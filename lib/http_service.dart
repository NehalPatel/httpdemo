import 'dart:convert';

import 'package:http/http.dart';

import 'post_model.dart';

class HttpService {
  final String postsUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response response = await get(postsUrl);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw "Server Error, failed to reterived posts.";
    }
  }

  Future<void> deletePost(int id) async {
    Response response = await delete("$postsUrl/$id");

    if (response.statusCode == 200) {
      print('deleted');
    }
  }
}
