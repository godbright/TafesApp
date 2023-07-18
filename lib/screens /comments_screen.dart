// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:aru_news/Services/globals.dart';
import 'package:aru_news/screens%20/others.dart';

import 'package:ionicons/ionicons.dart';
import 'package:aru_news/Services/auth_services.dart';
import 'package:aru_news/Services/remote_services.dart';
import 'package:aru_news/models/comments.dart';
import 'package:aru_news/models/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

// ignore: duplicate_ignore
class _CommentsScreenState extends State<CommentsScreen> {
  String comments = '';
  String? post_id;

  List<Post>? posts;
  List<Comments>? comment;
  // ignore: non_constant_identifier_names
  String? UserEmail;
  // ignore: non_constant_identifier_names
  String? Username;
  // ignore: non_constant_identifier_names
  String? Phone;

  @override
  void initState() {
    super.initState();
    getuserData();
    getId();
    getCommentData();

    setState(() {});
  }

  getCommentData() async {
    comment = await CommentsServices().getComments();
    if (comment != null) {
      setState(() {
        processing = true;
      });
    }
  }

  onSendComment() async {
    if (comments.isNotEmpty) {
      String username = Username.toString();
      String email = UserEmail.toString();
      String postId = post_id.toString();
      http.Response response =
          await AuthServices.comment(username, email, postId, comments);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Comment Sent!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            backgroundColor: const Color(0XFF4cbb17),
            textColor: Colors.white,
            fontSize: 13.dp);
      } else {
        Fluttertoast.showToast(
            msg: responseMap.values.first[0],
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.dp);
      }
    } else {
      Fluttertoast.showToast(
          gravity: ToastGravity.CENTER,
          msg: "Field cannot be Empty!",
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.dp);
    }
  }

  deleteData(String comm) async {
    String url = del_url + comm.toString();
    // ignore: unused_local_variable
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Comment Deleted Successfully!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: const Color(0XFF4cbb17),
          textColor: Colors.white,
          fontSize: 13.dp);
    }
  }

  final fieldText = TextEditingController();

  bool processing = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Comments",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          processing = true;
          await getCommentData();
          setState(() {});
        },
        child: comment == null
            ? const LoadingScreen()
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: comment!.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            if (post_id == comment![index].postId)
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage("assets/aru.png"),
                                ),
                              ),
                            if (post_id == comment![index].postId)
                              Row(
                                children: [
                                  Card(
                                      color: Colors.grey[300],
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  comment![index]
                                                      .username
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 13.dp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Text(
                                                  comment![index]
                                                      .comments
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Text(
                                                  DateFormat(
                                                          'EE, dd/MM  kk:mm a')
                                                      .format(
                                                          comment![index]
                                                              .createdAt!),
                                                  style: TextStyle(
                                                      fontSize: 10.dp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FontStyle.italic)),
                                            ]),
                                      )),
                                  Container(
                                    height: 4.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: IconButton(
                                        onPressed: () async {
                                          var comm = comment![index].id;
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text('Warning'),
                                              content: const Text(
                                                  'Do you want to delete this comment?'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      deleteData(
                                                          comm.toString());
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Delete'))
                                              ],
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Ionicons.trash_bin_outline,
                                          color: Colors.white,
                                          size: 17,
                                        )),
                                  ),
                                ],
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                              controller: fieldText,
                              onChanged: (value) {
                                comments = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your comment...",
                                contentPadding: const EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  borderSide: BorderSide(width: 5.w),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 8),
                          child: Container(
                            alignment: Alignment.center,
                            height: 9.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  onSendComment();
                                  fieldText.clear();
                                  setState(() {
                                    processing = true;
                                  });
                                },
                                icon: Icon(
                                  Ionicons.arrow_forward_circle_outline,
                                  size: 25.dp,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ));

  void getuserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    UserEmail = pref.getString('email');
    Username = pref.getString('username');
    Phone = pref.getString('phone');
    setState(() {});
  }

  void getId() async {
    final SharedPreferences post = await SharedPreferences.getInstance();
    post_id = post.getString("id");
  }
}
