// //ignore_for_file: import_of_legacy_library_into_null_safe, file_names

// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:sk_onboarding_screen/flutter_onboarding.dart';
// import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

// import 'login.dart';

// class Intro extends StatefulWidget {
//   const Intro({Key? key}) : super(key: key);

//   @override
//   _IntroState createState() => _IntroState();
// }

// class _IntroState extends State<Intro> {
//   final pages = [
//     SkOnboardingModel(
//         title: 'Fast Registration',
//         description: 'Easy to register and logging into the application',
//         titleColor: Colors.black,
//         descripColor: const Color(0xFF929794),
//         imagePath: 'assets/images/logine.jpg'),
//     SkOnboardingModel(
//         title: 'Browse for Categories',
//         description:
//             'Information is grouped according to the categories for easy lookup',
//         titleColor: Colors.black,
//         descripColor: const Color(0xFF929794),
//         imagePath: 'assets/images/sachi.jpg'),
//     SkOnboardingModel(
//         title: 'Instant Information Delivery',
//         description:
//             'We make information delivery fast and simple through timely alerts ',
//         titleColor: Colors.black,
//         descripColor: const Color(0xFF929794),
//         imagePath: 'assets/images/messege.jpg'),
//   ];

//   @override
//   Widget build(BuildContext context) =>
//       FlutterSizer(builder: (context, orientation, screenType) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: SKOnboardingScreen(
//             themeColor: const Color(0XFF06599F),
//             bgColor: Colors.white,
//             pages: pages,
//             skipClicked: (value) {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const LoginPage()));
//             },
//             getStartedClicked: (value) {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const LoginPage()));
//             },
//           ),
//         );
//       });
// }
