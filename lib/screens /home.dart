import 'package:aru_news/controllers/devotion_controller.dart';
import 'package:aru_news/controllers/events_controller.dart';
import 'package:aru_news/controllers/prayereq_controller.dart';
import 'package:aru_news/screens%20/Untitled-1.dart';
import 'package:aru_news/screens%20/daily_devotion.dart';
import 'package:aru_news/screens%20/news.dart';
import 'package:aru_news/screens%20/offerings.dart';
import 'package:aru_news/screens%20/prayer.dart';
import 'package:aru_news/screens%20/profile.dart';
import 'package:aru_news/screens%20/programs.dart';
import 'package:aru_news/widgets/videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DevotionController devotionController = Get.find();
  EventsController eventsController = Get.find();
  PrayerReqController prayerReqController = Get.find();
  var userId;
  var userName;

  @override
  void initState() {
    // TODO: implement initState
    devotionController.getDailyScript();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    eventsController.getEvents("2023");
    prayerReqController.getPrayers(prayerReqController.userid.value);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // var latest_event = eventsController.events_programs.length;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF242778),
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF292D89),
      //   elevation: 0.0,
      //   leading: IconButton(
      //     icon: Icon(Icons.menu),
      //     onPressed: () {
      //       _scaffoldKey.currentState?.openDrawer(); // Open the drawer
      //     },
      //   ),
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         padding: EdgeInsets.only(left: 7, bottom: 7),
      //         decoration: const BoxDecoration(color: Color(0xFF292D89)),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Container(
      //               height: 10,
      //               width: 27,
      //               decoration: const BoxDecoration(
      //                 shape: BoxShape.circle,
      //                 color: Colors.white,
      //               ),
      //               child: const CircleAvatar(
      //                 foregroundImage: AssetImage(
      //                   "assets/hands.png",
      //                 ),
      //               ),
      //             ),
      //             SizedBox(
      //               height: 1,
      //             ),
      //             // Username == null
      //             //     ? const Text("No User Found")
      //             //     : Padding(
      //             //         padding: EdgeInsets.only(left: 6.w),
      //             //         child: Text(
      //             //           Username.toString(),
      //             //           style:
      //             //               TextStyle(fontSize: 16., color: Colors.white),
      //             //         ),
      //             //       ),
      //             // UserEmail == null
      //             //     ? const Text("No User Found")
      //             //     : Padding(
      //             //         padding: EdgeInsets.only(left: 6.w),
      //             //         child: Text(
      //             //           UserEmail.toString(),
      //             //           style: TextStyle(
      //             //             fontSize: 13.,
      //             //             color: Colors.white60,
      //             //             fontStyle: FontStyle.normal,
      //             //           ),
      //             //         ),
      //             //       ),
      //           ],
      //         ),
      //       ),
      //       // ignore: avoid_unnecessary_containers
      //       ListTile(
      //         subtitle: const Text("User Profile "),
      //         onTap: () {
      //           Navigator.of(context).pop();
      //           Navigator.of(context).push(MaterialPageRoute(
      //               builder: (BuildContext context) => const Profile()));
      //         },
      //         // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
      //         leading: const Icon(
      //           Ionicons.person_circle_outline,
      //         ),
      //         title: Text(
      //           'Profile',
      //           style: TextStyle(fontSize: 14),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: Container(
        height: height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hello, ${prayerReqController.username.split(" ")[0]}',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                height: height * 0.16,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xFF292D89),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Ibada ya kusifu na Kuabudu",
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
                          "05:09",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                letterSpacing: .5,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.1),
                            child: Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.white,
                            )),
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
                height: height * 0.35,
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
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Services(
                            url: "assets/bible.png",
                            title: 'Daily Devotion',
                            desc:
                                "Get connected with the word of God everyday  ",
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
                            desc:
                                "Select a date and be updated with all events",
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
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: height * 0.1, maxHeight: double.infinity),
                child: Obx(() {
                  return Container(
                      height: height * 0.3,
                      width: width,
                      child: eventsController.events_programs.length == 0
                          ? Center(
                              child: Text("No events at the moment",
                                  style: TextStyle(color: Colors.white)),
                            )
                          : GridView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10),
                              itemCount:
                                  eventsController.events_programs.length,
                              itemBuilder: ((context, index) => VideoUpdates(
                                    venue: eventsController
                                        .events_programs[index].venue,
                                    id: eventsController
                                        .events_programs[index].id,
                                    date: eventsController
                                        .events_programs[index].date,
                                    desc: eventsController
                                        .events_programs[index].body,
                                    title: eventsController
                                        .events_programs[index].title,
                                    url: eventsController
                                        .events_programs[index].image,
                                  ))));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
