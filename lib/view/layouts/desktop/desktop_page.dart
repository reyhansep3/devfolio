// import 'package:flutter/material.dart';
// import 'package:flutter_portofolio/view/pages/home/sections/aboutme_section.dart';
// import 'package:flutter_portofolio/view/pages/home/sections/contact_section.dart';
// import 'package:flutter_portofolio/view/pages/home/sections/project_list.dart';
// import 'package:flutter_portofolio/view/pages/home/sections/top_section.dart';
// import 'package:flutter_portofolio/view/utils.dart';
// import 'package:flutter_portofolio/view/pages/home/widgets/navigation_bar.dart';

// class DesktopPage extends StatefulWidget {
//   const DesktopPage({super.key});

//   @override
//   State<DesktopPage> createState() => _DesktopPageState();
// }

// class _DesktopPageState extends State<DesktopPage> {
//   final topKey = GlobalKey();
//   final aboutKey = GlobalKey();
//   final projectKey = GlobalKey();
//   final contactKey = GlobalKey();
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff00285d),
//       body: CustomScrollView(
//         slivers: [
         
//           SliverAppBar(
//             pinned: true,
//             backgroundColor: Colors.black,
//             elevation: 0,
//             toolbarHeight: 80,
//             flexibleSpace: Navbar(
//               onNavTap: (section) {
//                 if (section == "home") scrollTo(topKey);
//                 if (section == "about") scrollTo(aboutKey);
//                 if (section == "project") scrollTo(projectKey);
//                 if (section == "contact") scrollTo(contactKey);
//               },
//             ),
//           ),

//           SliverToBoxAdapter(
//             child: Container(
//               key: topKey,
//               child: const TopSection(),
//             ),
//           ),

//           SliverToBoxAdapter(
//             child: Container(
//               key: aboutKey,
//               child: const AboutMe(),
//             ),
//           ),

//           SliverToBoxAdapter(
//             child: Container(
//               key: projectKey,
//               child: ProjectSection(),
//             ),
//           ),

//           SliverToBoxAdapter(
//             child: Container(
//               key: contactKey,
//               child: const ContactSection(),
//             ),
//           ),
          
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/formalities_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/aboutme_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top_section.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/navigation_bar.dart';


class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {

  String currentPage = "home";

  void onNavTap(String section) {
    setState(() {
      currentPage = section;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00285d),

      body: Column(
        children: [

          Container(
            height: 80,
            color: Colors.black,
            child: Navbar(
              onNavTap: onNavTap,
            ),
          ),

          Expanded(
            child: _buildPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildPage() {

    /// HOME PAGE
    if (currentPage == "home") {
      return CustomScrollView(
        key: const ValueKey("home"),

        slivers: [

          const SliverToBoxAdapter(
            child: TopSection(),
          ),

          const SliverToBoxAdapter(
            child: AboutMe(),
          ),

          SliverToBoxAdapter(
            child: ProjectSection(),
          ),

          const SliverToBoxAdapter(
            child: ContactSection(),
          ),

        ],
      );
    }

    if (currentPage == "formalities") {
      return const CustomScrollView(
        key: ValueKey("formalities"),

        slivers: [

          SliverToBoxAdapter(
            child: FormalitiesSection(),
          ),
          SliverToBoxAdapter(
            child: ExperienceSection(),
          ),

        ],
      );
    }

    return const SizedBox();
  }
}