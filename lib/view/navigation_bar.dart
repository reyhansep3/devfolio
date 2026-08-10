import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';


class Navbar extends StatelessWidget {
  final Function(String)? onNavTap;
  const Navbar({super.key, this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Responsivelayout(
      desktop: (context) => desktopTabletBody(context), 
      mobile: (context) => mobileBody(context), 
      tablet: (context) => desktopTabletBody(context)
    );
  }

  Widget mobileBody(BuildContext context){
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Dev/",
                  style: AppFontStyle.vtBodyMedium.copyWith(color: AppColor.yellowgreen)
                ),
                TextSpan(
                  text: "S3p.",
                  style: AppFontStyle.vtBodyMedium.copyWith(color: AppColor.white)
                ),
              ],
            ),
          ),

          // 
          // Row(
          //   children: [
          //     Row(
          //       children: [
          //         _navItem("Home", onTap: () => onNavTap?.call("home")),
          //         const SizedBox(width: 30),
          //         _navItem("Formalities", onTap: () => onNavTap?.call("formalities")),
          //       ],
          //     ),
          //   ],
          // ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Download CV",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
  Widget desktopTabletBody(BuildContext context){
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "<DEV",
                  style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 25)
                ),
                TextSpan(
                  text: "/S3P",
                  style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 25)
                ),
                TextSpan(
                  text: ">_",
                  style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 25)
                ),
              ],
            ),
          ),

          // 🔹 Menu tengah
          Row(
            children: [
              Row(
                children: [
                  _navItem("HOME", onTap: () => onNavTap?.call("home")),
                  const SizedBox(width: 30),
                  _navItem("ABOUT", onTap: () => onNavTap?.call("formalities")),
                  const SizedBox(width: 30),
                  _navItem("PROJECT", onTap: () => onNavTap?.call("project")),
                ],
              ),
              // _navItem("Home", onTap: () => onNavTap?.call("home")),
              // const SizedBox(width: 30),
              // _navItem("About", onTap: () => onNavTap?.call("about")),
              // const SizedBox(width: 30),
              // _navItem("Projects", onTap: () => onNavTap?.call("project")),
              // const SizedBox(width: 30),
              // _navItem("Contact", onTap: () => onNavTap?.call("contact")),
              // _navItem("Home", isActive: true),
              // const SizedBox(width: 30),
              // _navItem("Services"),
              // const SizedBox(width: 30),
              // _navItem("Projects"),
              // const SizedBox(width: 30),
              // _navItem("Contact"),
              // const SizedBox(width: 30),
              // _navItem("Blog"),
            ],
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Download CV",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
  Widget _navItem(
    String title, {
    bool isActive = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              )
            : null,
        child: Text(
          title,
          style: AppFontStyle.vcrMonoBodyLarge.copyWith(
            color: !isActive ?Colors.white : Colors.tealAccent, 
            fontSize: 15
          ),
          // style: TextStyle(
          //   color: isActive ? Colors.tealAccent : Colors.white70,
          // ),
        ),
      ),
    );
  }}