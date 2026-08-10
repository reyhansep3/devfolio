import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/about_me_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/experience_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/aboutme_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';
import 'package:flutter_portofolio/view/pages/projects/project_screen.dart';


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
            child: ProjectSection(
              onViewAll: () => onNavTap("project"), // <-- tambahkan ini
            ),
          ),

          // SliverToBoxAdapter(
          //   child: ProjectSection(),
          // ),
          const SliverToBoxAdapter(
            child: ContactSection(),
          ),
        ],
      );
    }

    if (currentPage == "formalities") {
      return CustomScrollView(
        key: const ValueKey("formalities"),
        slivers: [
          const SliverToBoxAdapter(
            child: FormalitiesSection(),
          ),
          SliverToBoxAdapter(
            child: ExperienceSection(),
          ),
        ],
      );
    }

    if (currentPage == "project") {
      return CustomScrollView(
        key: const ValueKey("project"),
        slivers: [
          SliverToBoxAdapter(
            child: ProjectList(),
          ),
        ],
      );
    }

    return const SizedBox();
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/about_me_section.dart';
// import 'package:flutter_portofolio/view/pages/formalities/sections/experience_section.dart';
// import 'package:flutter_portofolio/view/pages/home/sections/about/aboutme_section.dart';
// import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
// import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
// import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
// import 'package:flutter_portofolio/view/navigation_bar.dart';

// class DesktopPage extends StatefulWidget {
//   const DesktopPage({super.key});

//   @override
//   State<DesktopPage> createState() => _DesktopPageState();
// }

// class _DesktopPageState extends State<DesktopPage> {
//   final ScrollController _scrollController = ScrollController();

//   final GlobalKey _homeKey = GlobalKey();
//   final GlobalKey _formalitiesKey = GlobalKey();
//   final GlobalKey _projectKey = GlobalKey();
//   final GlobalKey _contactKey = GlobalKey();

//   void onNavTap(String section) {
//     GlobalKey? targetKey;
//     switch (section) {
//       case "home":
//         targetKey = _homeKey;
//         break;
//       case "formalities":
//         targetKey = _formalitiesKey;
//         break;
//       case "project":
//         targetKey = _projectKey;
//         break;
//       case "contact":
//         targetKey = _contactKey;
//         break;
//     }

//     if (targetKey?.currentContext != null) {
//       Scrollable.ensureVisible(
//         targetKey!.currentContext!,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff00285d),
//       body: Column(
//         children: [
//           Container(
//             height: 80,
//             color: Colors.black,
//             child: Navbar(
//               onNavTap: onNavTap,
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               controller: _scrollController,
//               child: Column(
//                 children: [
//                   SizedBox(key: _homeKey, child: const TopSection()),
//                   const AboutMe(),
//                   SizedBox(key: _formalitiesKey, child: const FormalitiesSection()),
//                   const ExperienceSection(),
//                   SizedBox(key: _projectKey, child: ProjectSection()),
//                   SizedBox(key: _contactKey, child: const ContactSection()),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }