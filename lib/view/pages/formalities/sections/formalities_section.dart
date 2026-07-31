// import 'package:flutter/material.dart';
// import 'package:flutter_portofolio/item/app_colors.dart';
// import 'package:flutter_portofolio/item/app_fonts.dart';
// import 'package:flutter_portofolio/item/media_query.dart';
// import 'package:flutter_portofolio/view/pages/formalities/widgets/animation_flying.dart';
// import 'package:flutter_portofolio/view/responsive_layout.dart';
// // import 'package:url_launcher/url_launcher.dart';

// class FormalitiesSection extends StatelessWidget {
//   const FormalitiesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Responsivelayout(
//       mobile: _mobileBody(width, height),
//       tablet: _tabletBody(width, height),
//       desktop: _desktopBody(context, width, height),
//     );
//   }
// }

// // void launchURL(String url) async {
// //   if (await canLaunch(url)) {
// //     await launch(url);
// //   }
// // }

// /// ================= DESKTOP =================
// Widget _desktopBody(BuildContext context, double width, double height) {
//   final screenHeight = MediaQuery.of(context).size.height;
//   const navbarHeight = 80.0; // masih belum fix
//   return Container(
//     color: Colors.black,
//     height: screenHeight - navbarHeight,
//     child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: context.width * 0.15,
//       vertical: context.width * 0.05),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Column(
//               children: [
//                 Text("About Me?",
//                     style: AppFontStyle.borelVeryLargeText),
//                 SizedBox(height: context.height*0.005,),
//                 Text(
//                   "Mobile Developer with 3+ years building scalable platforms and delivering high-impact solutions.",
//                   style: AppFontStyle.mediumText
//                     .copyWith(fontWeight: FontWeight.w300, color: AppColor.grey2),
//                     textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: context.height*0.1,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: 5,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "helo! my name is Reyhan Septri Asta.",
//                       style: AppFontStyle.largeText
//                           .copyWith(fontWeight: FontWeight.w300),
//                     ),
                    
//                     SizedBox(height: context.height*0.02,),
//                     Text(
//                       "Currently Working as a Flutter Developer at CKL Cargo",
//                       style: AppFontStyle.smallText
//                           .copyWith(fontWeight: FontWeight.w300, color: AppColor.grey1),
//                     ),
//                     SizedBox(height: context.height*0.01,),
//                     Container(
//                       height: context.height*0.003,
//                       width: context.width*0.1,
//                       decoration: const BoxDecoration(
//                         color: AppColor.white,
//                       ),
//                     ),
                    
//                     SizedBox(height: context.height*0.04,),

//                     Text(
//                       "I am a Flutter Developer passionate about building scalable and high-performance mobile applications, with hands-on experience in real-time features such as WebSocket communication, background services, location tracking, and push notifications, focusing on delivering clean, maintainable code and smooth user experiences.",
//                       style: AppFontStyle.smallText
//                           .copyWith(fontWeight: FontWeight.w300, color: AppColor.grey2),
//                           textAlign: TextAlign.justify,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 4,
//                 child: FlyingWidget(
//                   amplitude: 5,
//                   widget: Center(
//                     child: Image.asset(
//                       "assets/image/profile.png",
//                       width: context.width*0.4,
//                       height: context.height*0.4,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
          
                        
//           // SizedBox(height: context.height*0.02),   
//           // FlyingWidget(
//           //   amplitude: 5,
//           //   widget: Center(
//           //     child: Image.asset(
//           //       "assets/image/profile.png",
//           //       width: context.width*0.4,
//           //       height: context.height*0.4,
//           //     ),
//           //   ),
//           // ),
                 
          
//         ],
//       ),
//     ),
//   );
// }


// /// ================= MOBILE =================
// Widget _mobileBody(double width, double height) {
//   return Container(
//     width: width,
//     padding: const EdgeInsets.all(20),
//     color: Colors.black,
//     child: const Column(
//       children: [
//         Text("Mobile View", style: TextStyle(color: Colors.white)),
//       ],
//     ),
//   );
// }

// /// ================= TABLET =================
// Widget _tabletBody(double width, double height) {
//   return Container(
//     width: width,
//     height: height,
//     color: Colors.black,
//     child: const Center(
//       child: Text("Tablet View", style: TextStyle(color: Colors.white)),
//     ),
//   );
// }