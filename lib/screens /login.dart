// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks
import 'dart:convert';
import 'package:aru_news/Services/auth_services.dart';
import 'package:aru_news/models/posts.dart';
import 'package:aru_news/screens%20/LandingPage.dart';
import 'package:aru_news/screens%20/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Post>? posts;
  final _formKey = GlobalKey<FormState>();

  // ignore: prefer_typing_uninitialized_variables
  var useremail;

  bool processing = false;
  loginPressed() async {
    if (passwordController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      http.Response response = await AuthServices.login(
          emailController.text, passwordController.text);

      Map responseMap = jsonDecode(response.body);

      setState(() {
        processing = true;
      });

      try {
        if (responseMap["status"] == 0) {
          setState(() {
            processing = false;
          });
          final SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('id', responseMap["data"]['id'].toString());
          pref.setString('email', responseMap["data"]['email'].toString());
          pref.setString(
              'username', responseMap["data"]['username'].toString());
          pref.setString('phone', responseMap["data"]['phone'].toString());
          Fluttertoast.showToast(
              msg: "Login Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: const Color(0XFF4cbb17),
              textColor: Colors.white,
              fontSize: 13.dp);

          //move to home screen
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LandingPage()),
            (Route<dynamic> route) => false,
          );
        } else {
          setState(() {
            processing = false;
          });
          Fluttertoast.showToast(
              msg: responseMap["message"],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 13.dp);
        }
      } catch (e) {
        print(e);
      }
    } else {
      setState(() {
        processing = false;
      });
      Fluttertoast.showToast(
          msg: "Enter all required fields",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.dp);
    }
  }

  @override
  Widget build(BuildContext context) =>
      FlutterSizer(builder: (context, orientation, screenType) {
        return Scaffold(
            body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Center(
                  // ignore: sized_box_for_whitespace
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: 80.w,
                      height: 90.h,
                      child: Column(
                        children: [
                          Image(
                            image: const AssetImage("assets/aru.png"),
                            height: 30.h,
                          ),

                          TextFormField(
                              controller: emailController,
                              onChanged: (value) {
                                email = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.mail_outline),
                                hintText: "Enter your Email",
                                contentPadding: EdgeInsets.only(top: 0.h),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  borderSide: BorderSide(width: 5.w),
                                ),
                              )),
                          SizedBox(
                            height: 3.h,
                          ),
                          TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_outline),
                                hintText: "Enter your Password",
                                contentPadding: EdgeInsets.only(top: 0.h),
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    borderSide: BorderSide(width: 5.w)),
                              )),
                          SizedBox(
                            height: 3.h,
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            height: 5.h,
                            width: 45.w,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  processing = true;
                                });

                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    processing = true;
                                  });
                                  loginPressed();
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      processing = false;
                                    });
                                  });
                                } else {
                                  return;
                                }
                              },
                              child: processing
                                  // ignore: avoid_unnecessary_containers
                                  ? Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF292D89)),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF292D89)),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.dp),
                                        ),
                                      ),
                                    ),
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),

                          GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text(
                                "Don't have an Account? Sign Up",
                                style: TextStyle(
                                  fontSize: 12.dp,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
      });
}
