import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/pages/blog/blog_page.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me_stories/about_stories_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/skills_expertise/skills_experties_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/skill_section.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/about_me_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/experience_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/what_drives_me_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
import 'package:flutter_portofolio/view/pages/projects/project_screen.dart';
import 'package:flutter_portofolio/animation/scroll_reveal.dart';
import 'package:flutter_portofolio/view/cv_download.dart';

class MobilePage extends StatelessWidget {
  final String section;
  const MobilePage({Key? key, required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = _buildBody(context);
    final isDarkPage = section != 'project';

    return Scaffold(
      backgroundColor: isDarkPage ? const Color(0xFF151715) : const Color(0xFFF0F0EB),
      appBar: AppBar(
        backgroundColor: isDarkPage ? const Color(0xFF151715) : const Color(0xFFF0F0EB),
        iconTheme: IconThemeData(color: isDarkPage ? Colors.white : AppColor.darkUI),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "<DEV",
                style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: isDarkPage ? Colors.white : AppColor.darkUI, fontSize: 20),
              ),
              TextSpan(
                text: "/S3P",
                style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: isDarkPage ? AppColor.yellowgreen : AppColor.darkUI, fontSize: 20),
              ),
              TextSpan(
                text: ">_",
                style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: isDarkPage ? Colors.white : AppColor.darkUI, fontSize: 20),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: GestureDetector(
                onTap: downloadCv,
                child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isDarkPage ? AppColor.yellowgreen : Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Download CV',
                  style: TextStyle(
                    color: isDarkPage ? const Color(0xFF151715) : Colors.white,
                    fontSize: 12,
                  ),
                ),
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
              _buildDrawerItem(context, 'BLOG', 'blog'),
            ],
          ),
        ),
      ),
      body: ColoredBox(
        color: isDarkPage ? const Color(0xFF151715) : const Color(0xFFF0F0EB),
        child: body,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (section == 'formalities') {
      return ListView(
        children: [
          const FormalitiesSection(),
          const ScrollReveal(fromLeft: false, child: AboutMeSection()),
          const ScrollReveal(
            fromLeft: false,
            child: SkillsExpertiesSection(),
          ),
          ScrollReveal(child: ExperienceSection()),
          const WhatDrivesMeSection(),
          const ScrollReveal(
            fromLeft: false,
            child: ContactSection(
              editorialStyle: true,
              darkStyle: true,
              eyebrow: '06  /  GET IN TOUCH',
              headline: 'Let’s build\nwhat’s next.',
            ),
          ),
        ],
      );
    }

    if (section == 'project') {
      return ListView(children: const [
        ProjectList(),
        ScrollReveal(
          fromLeft: false,
          child: ContactSection(
            editorialStyle: true,
            eyebrow: '07  /  GET IN TOUCH',
          ),
        ),
      ]);
    }

    if (section == 'blog') {
      return ListView(children: const [
        BlogPage(),
        ScrollReveal(
          fromLeft: false,
          child: ContactSection(
            editorialStyle: true,
            darkStyle: true,
            eyebrow: '02  /  GET IN TOUCH',
          ),
        ),
      ]);
    }

    return ListView(
      children: [
        const TopSection(),
        const SkillSection(),
        ProjectSection(
          onViewAll: () => GoRouter.of(context).go('/project'),
        ),
        const ScrollReveal(
          fromLeft: false,
          child: ContactSection(editorialStyle: true, homeContact: true),
        ),
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
