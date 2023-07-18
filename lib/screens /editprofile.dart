import 'dart:convert';
import 'dart:io';

import 'package:aru_news/controllers/prayereq_controller.dart';
import 'package:aru_news/screens%20/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Edit extends StatefulWidget {
  Map<String, dynamic>? user;
  Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone_c = TextEditingController();
  TextEditingController email = TextEditingController();
  PrayerReqController loginController = Get.find();
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    fname = TextEditingController(
        text: loginController.username.value.split(" ")[0]);
    lname = TextEditingController(
        text: loginController.username.value.split(" ")[1]);
    phone_c = TextEditingController(text: loginController.phone.value);
  }

//   XFile? image;
//   final ImagePicker picker = ImagePicker();
//   String base64Image = "";
// // Function to pick an image from camera or gallery
//   Future<void> getImage(ImageSource media) async {
//     final XFile? img = await picker.pickImage(source: media);

//     if (img != null) {
//       setState(() {
//         image = img;
//       });

//       // Obtain base64-encoded image
//       List<int> imageBytes = await img.readAsBytes();
//       base64Image = base64Encode(imageBytes);

//       // Use the base64Image as needed
//       print(base64Image);
//     } else {
//       // Handle the case when no image is picked
//       print('No image selected');
//     }
//   }

  // EditInfo() async {
  //   var data = {
  //     'f_name': fname.text,
  //     'l_name': lname.text,
  //     'phone': phone_c.text,
  //   };

  //   await loginController.editUserProfile(data);
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: size.height * 0.2,
              width: size.width,
              child: Container(
                  width: size.width * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/aru-logo.png",
                      //to show image, you type like this.
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    controller: fname,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Color(0xFF242778)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      focusColor: Color(0xFF242778),
                      hintText: 'First Name',
                      labelText: "First Name",
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    controller: lname,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Color(0xFF242778)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      focusColor: Color(0xFF242778),
                      hintText: 'Last Name',
                      labelText: "Last Name",
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    controller: phone_c,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.grey.shade100,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Color(0xFF242778)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        focusColor: Color(0xFF242778),
                        hintText: 'Phone Number',
                        labelText: "Phone Number"),
                    onChanged: (phone) {},
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  GestureDetector(
                    onTap: (() {
                      // editProfileInfo();
                    }),
                    child: Container(
                      height: size.height / 16,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF242778),
                            width: 1,
                          )),
                      child: Center(
                        child: false
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text("Save",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF242778))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (() async {
                      setState(() {
                        isloading = true;
                      });

                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      localStorage.clear();

                      if (localStorage.getString('id') == null) {
                        Get.offAll(() => const AuthPage());
                      }
                    }),
                    child: Container(
                      height: size.height / 16,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFF242778),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Log out",
                            style: GoogleFonts.poppins(color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
