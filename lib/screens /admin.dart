// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:aru_news/Services/globals.dart';
import 'package:aru_news/Services/remote_services.dart';
import 'package:aru_news/screens%20/comments_screen.dart';
import 'package:aru_news/screens%20/others.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/posts.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  // ignore: non_constant_identifier_names
  String? UserEmail;
  // ignore: non_constant_identifier_names
  String? Username;
  // ignore: non_constant_identifier_names
  String? Phone;
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //Fetching data from API

    setState(() {});
    getData();
  }

  getData() async {
    posts = await AdminServices().getPosts();

    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    } else {}
  }

  // ignore: unused_element
  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    // ignore: avoid_print
    print(info);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            isLoaded = true;
            await getData();
            setState(() {});
          },
          child: posts == null
              ? const LoadingScreen()
              : ListView.builder(
                  itemCount: posts?.length,
                  itemBuilder: (context, index) {
                    // ignore: dead_code

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: Card(
                          color: Colors.grey[200],
                          elevation: 5,
                          shadowColor: Colors.black,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              posts![index].image != null
                                  ? Image.network(
                                      imageUrl + posts![index].image)
                                  : Text(""),
                              ListTile(
                                title: Text(
                                  posts![index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.dp),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      'From: ' + posts![index].categoryType,
                                      style: const TextStyle(
                                          color: Color(0XFF06599F)),
                                    ), //
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(14, 3, 12, 14),
                                child: ReadMoreText(
                                  posts![index].body,
                                  trimLines: 4,
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.justify,
                                  colorClickableText: const Color(0XFF06599F),
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Read more',
                                  trimExpandedText: ' Show less',
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.dp),
                                    child: Text(
                                      "Created At: " +
                                          DateFormat('dd-MM-yyyy kk:mm a')
                                              .format(posts![index].createdAt),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          final SharedPreferences post =
                                              await SharedPreferences
                                                  .getInstance();

                                          post.setString('id',
                                              posts![index].id.toString());

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CommentsScreen()));
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Ionicons.chatbubbles_outline,
                                              color: Colors.black,
                                            )
                                          ],
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          // ignore: unused_local_variable
                                          String url =
                                              imageUrl + posts![index].image;
                                          await GallerySaver.saveImage(url,
                                              albumName: "Aru-app");
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Image Downloaded to gallery',
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.CENTER,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 13.dp);
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Ionicons
                                                  .arrow_down_circle_outline,
                                              color: Colors.black,
                                            )
                                          ],
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          // ignore: unused_local_variable
                                          final urlimage =
                                              imageUrl + posts![index].image;
                                          final uri = Uri.parse(urlimage);
                                          final res = await http.get(uri);
                                          final bytes = res.bodyBytes;

                                          final temp =
                                              await getTemporaryDirectory();
                                          final path =
                                              '${temp.path}/${posts![index].image}';

                                          File(path).writeAsBytesSync(bytes);

                                          await Share.shareFiles([path]);
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Ionicons.share_social_outline,
                                              color: Colors.black,
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        ),
      );

  void getuserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    UserEmail = pref.getString('email');
    Username = pref.getString('username');
    Phone = pref.getString('phone');
    setState(() {});
  }
}
