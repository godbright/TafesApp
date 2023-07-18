import 'package:aru_news/screens%20/daily_devotion.dart';
import 'package:aru_news/screens%20/login.dart';
import 'package:aru_news/screens%20/news.dart';
import 'package:aru_news/screens%20/offerings.dart';
import 'package:aru_news/screens%20/prayer.dart';
import 'package:aru_news/screens%20/prayerList.dart';
import 'package:aru_news/screens%20/profile.dart';
import 'package:aru_news/screens%20/programs.dart';
import 'package:aru_news/screens%20/testimonyList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getuserData();
  }

  // // ignore: non_constant_identifier_names
  // String? UserEmail;
  // // ignore: non_constant_identifier_names
  // String? Username;
  // // ignore: non_constant_identifier_names
  // String? Phone;
  // bool processing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(left: 7.dp, bottom: 7.dp),
            decoration: const BoxDecoration(
              color: Color(0XFF06599F),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10.h,
                  width: 27.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const CircleAvatar(
                    foregroundImage: AssetImage("assets/bible.png"),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                // Username == null
                //     ? const Text("No User Found")
                //     : Padding(
                //         padding: EdgeInsets.only(left: 6.w),
                //         child: Text(
                //           Username.toString(),
                //           style:
                //               TextStyle(fontSize: 16.dp, color: Colors.white),
                //         ),
                //       ),
                // UserEmail == null
                //     ? const Text("No User Found")
                //     : Padding(
                //         padding: EdgeInsets.only(left: 6.w),
                //         child: Text(
                //           UserEmail.toString(),
                //           style: TextStyle(
                //             fontSize: 13.dp,
                //             color: Colors.white60,
                //             fontStyle: FontStyle.normal,
                //           ),
                //         ),
                //       ),
              ],
            ),
          ),
          // ignore: avoid_unnecessary_containers
          ListTile(
            subtitle: const Text("User Profile "),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Profile()));
            },
            // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
            leading: const Icon(
              Ionicons.person_circle_outline,
            ),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 14.dp),
            ),
          ),

          ListTile(
            subtitle: const Text("Self Customization "),
            onTap: () {},
            // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
            leading: const Icon(
              Ionicons.cog,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 14.dp),
            ),
          ),

          ListTile(
            subtitle: const Text("Support you Need"),
            onTap: () {},
            // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
            leading: const Icon(
              Ionicons.help_circle_outline,
            ),
            title: Text(
              'Help & Support',
              style: TextStyle(fontSize: 14.dp),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.dp),
            child: Container(
              height: 8.5.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
              child: ListTile(
                subtitle: const Text(
                  "Exit the Application",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  AlertDialog alert = AlertDialog(
                    title: Row(
                      children: [
                        const Icon(
                          Ionicons.warning_outline,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        const Text("Warning!")
                      ],
                    ),
                    content: const Text("Are you sure you want to exit?"),
                    actions: [
                      // TextButton(
                      //     onPressed: () async {
                      //       setState(() {
                      //         processing = true;
                      //       });
                      //       SharedPreferences prefs =
                      //           await SharedPreferences.getInstance();
                      //       prefs.clear();
                      //       Future.delayed(const Duration(seconds: 1), () {
                      //         setState(() {
                      //           processing = false;
                      //         });
                      //         Navigator.of(context).push(MaterialPageRoute(
                      //             builder: (BuildContext context) =>
                      //                 const LoginPage()));
                      //       });
                      //     },
                      //     child: processing
                      //         // ignore: avoid_unnecessary_containers
                      //         ? Container(
                      //             child: Row(
                      //               children: [
                      //                 SizedBox(
                      //                   width: 6.w,
                      //                   height: 4.h,
                      //                   child: const CircularProgressIndicator(
                      //                     strokeWidth: 2,
                      //                     color: Colors.blue,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           )
                      //         : const Text("Yes"))
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      });
                },
                // onTap: () async {
                //   SharedPreferences prefs =
                //       await SharedPreferences.getInstance();
                //   prefs.clear();
                // },
                // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                leading:
                    const Icon(Ionicons.log_out_outline, color: Colors.white),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 14.dp, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));

    backgroundColor:
    Color(0xFF242778);
    body:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Image.asset(
              "assets/menu.png",
              width: 30,
              height: 30,
            )),
        SizedBox(
          height: 40,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Hello, Welcome',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xFF292D89),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cross OverNight",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "09:30 PM",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Center(child: Text("...")),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "CCC UPANGA",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 10,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'What we Have!',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF242778),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Services(
                      url: "assets/bible.png",
                      title: 'Daily Devotion',
                      desc: "Get connected with the word of God everyday  ",
                      screenName: "devotion"),
                  Services(
                      url: "assets/Megaphone.png",
                      title: 'Testimony',
                      desc: "sdfasdfdsfsdfsdfds",
                      screenName: "testimony"),
                  Services(
                      url: "assets/hands.png",
                      title: 'Prayer Request',
                      desc:
                          "Don’t feel lonely. Send us your prayer and We’ll join you",
                      screenName: "prayer"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Services(
                      url: "assets/gift.png",
                      title: 'Offering',
                      desc:
                          "Don’t feel lonely. Send us your prayer and We’ll join you",
                      screenName: "offering"),
                  Services(
                      url: "assets/appw.png",
                      title: 'Programs',
                      desc: "Select a date and be updated with all events",
                      screenName: "programs"),
                  Services(
                      url: "assets/link.png",
                      title: 'Updates/Media',
                      desc: "sdfasdfdsfsdfsdfds",
                      screenName: "socials")
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                  )),
              Text("See more",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              "assets/link.png",
              width: 100,
              height: 100,
            ),
            Text("Pastor John",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 8,
                      fontWeight: FontWeight.w300),
                )),
            Text("Aru Main Campas",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 7,
                      fontWeight: FontWeight.w200),
                ))
          ]),
        )
      ],
    );
  }

  // void getuserData() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   UserEmail = pref.getString('email');
  //   Username = pref.getString('username');
  //   Phone = pref.getString('phone');
  //   setState(() {});
  // }
}

class Services extends StatelessWidget {
  String url;
  String desc;
  String title;
  String screenName;
  Services({
    required this.url,
    required this.title,
    required this.desc,
    required this.screenName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            if (screenName == "testimony") {
              Get.to(() => TestmonyList(url: url));
            }
            if (screenName == "prayer") {
              Get.to(() => PrayerList(url: url));
            } else if (screenName == "devotion") {
              Get.to(() => Devotion(url: url, desc: desc, title: title));
            } else if (screenName == "programs") {
              Get.to(() => Programs(url: url, desc: desc, title: title));
            } else if (screenName == "offering") {
              Get.to(() => Offerings(url: url, desc: desc, title: title));
            } else if (screenName == "socials") {
              Get.to(() => News());
            }
          }),
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(3, 10, 3, 10),
            decoration: BoxDecoration(
              color: Color(0xFF292D89),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Center(
                child: Image.asset(
              url,
              width: 30,
              height: 30,
            )),
          ),
        ),
        SizedBox(
          height: 1,
        ),
        Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ))
      ],
    );
  }
}
