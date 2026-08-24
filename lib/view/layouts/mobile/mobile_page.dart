import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/about_me_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/experience_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/aboutme_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
import 'package:flutter_portofolio/view/pages/projects/project_screen.dart';

class MobilePage extends StatelessWidget {
  final String section;
  const MobilePage({Key? key, required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = _buildBody(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "<DEV",
                style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 20),
              ),
              TextSpan(
                text: "/S3P",
                style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: AppColor.yellowgreen, fontSize: 20),
              ),
              TextSpan(
                text: ">_",
                style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: AppColor.yellowgreen, fontSize: 20),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Download CV',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Navigation',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
              _buildDrawerItem(context, 'HOME', 'home'),
              _buildDrawerItem(context, 'ABOUT', 'formalities'),
              _buildDrawerItem(context, 'PROJECT', 'project'),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (section == 'formalities') {
      return Column(
        children: [
          const FormalitiesSection(),
          ExperienceSection(),
        ],
      );
    }

    if (section == 'project') {
      return ProjectList();
    }

    return Column(
      children: [
        const TopSection(),
        const AboutMe(),
        ProjectSection(
          onViewAll: () => GoRouter.of(context).go('/project'),
        ),
        const ContactSection(),
      ],
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, String sectionKey) {
    final isActive = section == sectionKey || (sectionKey == 'home' && section == 'home');
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.tealAccent : Colors.white,
          fontWeight: isActive ? FontWeight.w700 : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        final location = sectionKey == 'home' ? '/' : '/$sectionKey';
        GoRouter.of(context).go(location);
      },
    );
  }
}
