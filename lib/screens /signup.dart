// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:aru_news/Services/auth_services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final List<String> items = [
    'Associate',
    'Student',
  ];
  String? selectedValue;

  String username = '';
  String email = '';
  String phone = '';

  String password = '';

  var year = null;
  final _formKey = GlobalKey<FormState>();
  bool processing = false;
  createAccountPressed() async {
    setState(() {
      processing = true;
    });

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      http.Response response = await AuthServices.register(username, email,
          phone, password, selectedValue == "Associate" ? 1 : 0, year);
      Map responseMap = jsonDecode(response.body);
      print(responseMap);
      if (responseMap["status"] == 1) {
        setState(() {
          processing = false;
        });
        Fluttertoast.showToast(
            msg: "Account Created Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            backgroundColor: const Color(0XFF4cbb17),
            textColor: Colors.white,
            fontSize: 13.dp);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage(),
            ));
      } else {
        setState(() {
          processing = false;
        });
        Fluttertoast.showToast(
            msg: responseMap.values.first[0],
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.dp);
      }
    } else {
      setState(() {
        processing = false;
      });
      Fluttertoast.showToast(
          msg: "Email not Valid",
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.dp);
    }
  }

  @override
  Widget build(BuildContext context) =>
      FlutterSizer(builder: (context, orientation, screenType) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(children: [
              Form(
                key: _formKey,
                child: Center(
                  // ignore: sized_box_for_whitespace
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: 80.w,
                      height: 100.h,
                      child: Column(
                        children: [
                          Image(
                            image: const AssetImage("assets/aru.png"),
                            height: 10.h,
                          ),
                          // const Text("LOGIN"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              username = value;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              // ignore: prefer_const_constructors
                              prefixIcon: Icon(Icons.person_outline),
                              hintText: "Username",
                              contentPadding: EdgeInsets.only(top: 0.h),
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  borderSide: BorderSide(width: 5.w)),
                            ),
                          ),

                          SizedBox(
                            height: 3.h,
                          ),
                          Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Select Item',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  width: width,
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  elevation: 2,
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.grey,
                                  iconDisabledColor: Colors.grey,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  offset: const Offset(-20, 0),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness:
                                        MaterialStateProperty.all<double>(6),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the Year ';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                year = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // ignore: prefer_const_constructors
                                prefixIcon: Icon(Icons.timelapse),
                                hintText: "Year Finished",
                                contentPadding: EdgeInsets.only(top: 0.h),
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    borderSide: BorderSide(width: 5.w)),
                              )),

                          SizedBox(
                            height: 3.h,
                          ),
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                email = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // ignore: prefer_const_constructors
                                prefixIcon: Icon(Icons.mail_outline),
                                hintText: "Email",
                                contentPadding: EdgeInsets.only(top: 0.h),
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    borderSide: BorderSide(width: 5.w)),
                              )),

                          SizedBox(
                            height: 3.h,
                          ),
                          TextFormField(
                              onChanged: (value) {
                                phone = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone Number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.phone_android_outlined),
                                hintText: "Phone Number",
                                contentPadding: EdgeInsets.only(top: 0.h),
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    borderSide: BorderSide(width: 5.w)),
                              )),
                          SizedBox(
                            height: 3.h,
                          ),
                          TextFormField(
                              obscureText: true,
                              onChanged: (value) {
                                password = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                // ignore: prefer_const_constructors
                                prefixIcon: Icon(Icons.lock_outline),
                                hintText: "Password",
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
                              decoration: BoxDecoration(
                                  color: const Color(0XFF06599F),
                                  borderRadius: BorderRadius.circular(10)),
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    createAccountPressed();
                                  } else {
                                    return;
                                  }
                                },
                                child: processing
                                    ? Column(
                                        children: const [
                                          CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ],
                                      )
                                    : GestureDetector(
                                        child: Center(
                                          child: processing
                                              ? CircularProgressIndicator(
                                                  color: Colors.blue,
                                                )
                                              : Text(
                                                  "Sign Up",
                                                  style: TextStyle(
                                                      fontSize: 15.dp,
                                                      color: Colors.white),
                                                ),
                                        ),
                                      ),
                              )),
                          SizedBox(
                            height: 3.h,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: const Text(
                                "Already Have an Account? Login",
                                style: TextStyle(fontSize: 15),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        );
      });
}
