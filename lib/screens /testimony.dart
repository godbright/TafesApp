import 'package:aru_news/controllers/prayereq_controller.dart';
import 'package:aru_news/controllers/testimonyController.dart';
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

class Testimony extends StatelessWidget {
  String url;
  String desc;
  String title;

  TestimonyController testimonyController = Get.find();
  Testimony(
      {Key? key, required this.url, required this.desc, required this.title})
      : super(key: key);

  TextEditingController testimonyTextController = TextEditingController();

  sendTestimony() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var id = localStorage.get("id");
    var data = {
      "user_id": id,
      "testimony_request": testimonyTextController.text
    };
    testimonyController.sendTestimony(data, "testimony/request");
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
                    controller: testimonyTextController,
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
                      hintText: "Please Enter your Testimony ",
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
                  onTap: () => sendTestimony(),
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xFF014783),
                        borderRadius: BorderRadius.circular(10)),
                    child: testimonyController.loading.value == false
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
                        : Center(child: CircularProgressIndicator()),
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
