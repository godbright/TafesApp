// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:aru_news/screens%20/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'news.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) =>
      FlutterSizer(builder: (context, orientation, screenType) {
        return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const News()));
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.dp,
                    fontWeight: FontWeight.normal),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  color: Colors.black,
                )
              ],
            ),
            body: Stack(clipBehavior: Clip.none, children: [
              Column(
                children: [
                  Container(
                    height: 20.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: const CircleAvatar(
                      foregroundImage: AssetImage(
                        "assets/bible.png",
                      ),
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Column(
                      children: [
                        Text(
                          Username.toString(),
                          style: TextStyle(
                              fontSize: 16.dp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          UserEmail.toString(),
                          style: TextStyle(
                            fontSize: 16.dp,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.dp),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Edit()));
                            },
                            child: Container(
                              height: 9.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.dp))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.dp),
                                    child: Container(
                                      height: 5.h,
                                      width: 12.w,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7.dp))),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Ionicons.people_outline,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Edit()));
                                    },
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                          fontSize: 14.dp,
                                          color: Colors.grey[800]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.dp),
                          child: Container(
                            height: 9.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.dp))),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.dp),
                                  child: Container(
                                    height: 5.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow[900],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7.dp))),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Ionicons.cog_outline,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Settings",
                                    style: TextStyle(
                                        fontSize: 14.dp,
                                        color: Colors.grey[800]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.dp),
                          child: Container(
                            height: 9.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.dp))),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.dp),
                                  child: Container(
                                    height: 5.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7.dp))),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Ionicons.help_circle_outline,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Help & Support",
                                    style: TextStyle(
                                        fontSize: 14.dp,
                                        color: Colors.grey[800]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.dp),
                          child: Container(
                            height: 9.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.dp))),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.dp),
                                  child: Container(
                                    height: 5.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7.dp))),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Ionicons.log_out_outline,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(
                                        fontSize: 14.dp,
                                        color: Colors.grey[800]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]));
      });
  void getuserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    UserEmail = pref.getString('email');
    Username = pref.getString('username');
    Phone = pref.getString('phone');
    setState(() {});
  }
}
