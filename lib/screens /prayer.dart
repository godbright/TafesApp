import 'package:aru_news/controllers/prayereq_controller.dart';
import 'package:aru_news/screens%20/others.dart';
import 'package:aru_news/screens%20/prayerSent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerRequest extends StatelessWidget {
  String url;
  String desc;
  String title;

  PrayerReqController prayerController = Get.find();
  PrayerRequest(
      {Key? key, required this.url, required this.desc, required this.title})
      : super(key: key);

  TextEditingController prayer_controller = TextEditingController();

  sendPrayerRequest() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var id = localStorage.get("id");
    var data = {"user_id": id, "prayer_request": prayer_controller.text};
    prayerController.sendPrayerRequest(data, "prayer/request");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF242778),
      ),
      backgroundColor: Color(0xFF242778),
      body: SingleChildScrollView(
        child: Obx(() {
          return Container(
            margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
            child: Column(
              children: [
                Image.asset(
                  url,
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {},
                    controller: prayer_controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Description';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    minLines: 8, //Normal textInputField will be displayed
                    maxLines: 10, // when user presses enter it will adapt to it
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Please Enter your Prayer Request",
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(width: 5.w),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () => sendPrayerRequest(),
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xFF014783),
                        borderRadius: BorderRadius.circular(10)),
                    child: !prayerController.loading.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Send",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200),
                                  )),
                              Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
