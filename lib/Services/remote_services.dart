import 'package:aru_news/Services/globals.dart';
import 'package:aru_news/models/comments.dart';
import 'package:aru_news/models/posts.dart';

import 'package:http/http.dart' as http;

class AdminServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(categoryURL + "administration/posts");

    var response =
        await client.get(uri, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var data = response.body;
      return postFromJson(data);
    }
    return null;
  }
}

class AdvertsServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(categoryURL + "advertisements/posts");

    var response =
        await client.get(uri, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var data = response.body;
      return postFromJson(data);
    }
    return null;
  }
}

class SportsServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(categoryURL + "sports/posts");
    var response;
    try {
      response =
          await client.get(uri, headers: {"Content-Type": "application/json"});
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      var data = response.body;
      return postFromJson(data);
    }
    return null;
  }
}

class OthersServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(categoryURL + "others/posts");

    var response;

    try {
      response =
          await client.get(uri, headers: {"Content-Type": "application/json"});
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      var data = response.body;
      return postFromJson(data);
    }
    return null;
  }
}

class ReligionServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(categoryURL + "religion/posts");

    var response =
        await client.get(uri, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var data = response.body;
      return postFromJson(data);
    }
    return null;
  }
}

class CommentsServices {
  Future<List<Comments>?> getComments() async {
    var client = http.Client();

    var uri = Uri.parse(baseURL + "comments");

    var response =
        await client.get(uri, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var data = response.body;
      return commentsFromJson(data);
    }
    return null;
  }
}
