import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
// import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_portofolio/view/pages/formalities/sections/skills_expertise/utils/skill_category.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/skills_expertise/widgets/skills_card.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/skills_expertise/widgets/tech_stack.dart';
// import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:google_fonts/google_fonts.dart';

 

  final List<SkillCategory> categories = [
    const SkillCategory(
      title: 'Web Development',
      description: 'Building modern, responsive web applications',
      icon: Icons.code_rounded,
      technologies: [
        'React',
        'TypeScript',
        'JavaScript',
        'Laravel',
        'HTML',
        'CSS',
        'TailwindCSS',
        'Bootstrap',
        'Firebase',
      ],
    ),
    const SkillCategory(
      title: 'Backend & API',
      description: 'Creating robust and scalable backend services',
      icon: Icons.polyline_rounded,
      technologies: [
        'Golang',
        'Laravel',
        'REST API',
        'MySQL',
        'PostgreSQL',
        'Firebase',
      ],
    ),
    // const SkillCategory(
    //   title: 'AI & Machine Learning',
    //   description: 'Developing intelligent solutions with ML/AI',
    //   icon: Icons.monitor_heart_outlined,
    //   technologies: [
    //     'Python',
    //     'TensorFlow',
    //     'PyTorch',
    //     'Scikit-learn',
    //     'CNN',
    //     'RNN',
    //   ],
    // ),
    const SkillCategory(
      title: 'Mobile Development',
      description: 'Cross-platform mobile app development',
      icon: Icons.phone_android_rounded,
      technologies: [
        'Flutter',
        'React Native',
        'Dart',
        'Firebase',
        'REST API',
        'BLoC',
        'Provider',
      ],
    ),
  ];

Widget skillExpertiesTabletBody(BuildContext context, double width, double height, int selectedCategory ,void Function(int index) onCategoryChanged) {
  final scale = (width / 1024).clamp(0.5, 1.3);
  final category = categories[selectedCategory];

  final List<String> infrastructureTools = [
    'Netlify',
    'Figma',
    'Git',
    'Github',
    'Gitlab',
    'Insomnia',
    'Postman',
    'Firebase',
    'Docker',
  ];
  final List<String> highlightedTools = [
    'Netlify',
    'Figma',
    'Git',
    'Github',
    'Gitlab',
    'Insomnia',
    'Postman',
  ];


  return Container(
    color: AppColor.primary,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.all(mq.MediaQueryValues(context).width * 0.08),
      // padding: EdgeInsets.symmetric(
      //   horizontal: mq.MediaQueryValues(context).width * 0.15,
      //   vertical: mq.MediaQueryValues(context).width * 0.05,
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Experties',
            style: GoogleFonts.poppins(
              fontSize: 20 * scale,
              fontWeight: FontWeight.w800,
              height: 0.95,
              letterSpacing: 5,
              color: AppColor.darkUI,
            ),
          ),
          SizedBox(
            height: mq.MediaQueryValues(context).height * 0.02,
          ),
      
          Container(
            height: 4,
            width: mq.MediaQueryValues(context).width * 0.07,
            decoration: BoxDecoration(
              color: AppColor.grey1,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
      
          SizedBox(
            height: mq.MediaQueryValues(context).height * 0.02,
          ),
      
          Container(
            margin: EdgeInsets.only(
              left: mq.MediaQueryValues(context).width * 0.02,
            ),
            height: 4,
            width: mq.MediaQueryValues(context).width * 0.1,
            decoration: BoxDecoration(
              color: AppColor.grey1,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SizedBox(
            height: mq.MediaQueryValues(context).height * 0.02,
          ),
          
          SizedBox(height: mq.MediaQueryValues(context).height * 0.02),
          Row(
            children: List.generate(
              categories.length,
              (index) {
                final item = categories[index];
                final isSelected = selectedCategory == index;
    
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == categories.length - 1 ? 0 : 16,
                    ),
                    child: SkillCategoryCard(
                      category: item,
                      selected: isSelected,
                      onTap: () {
                        onCategoryChanged(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: mq.MediaQueryValues(context).height * 0.04,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: TechnologyStack(
              key: ValueKey(selectedCategory),
              technologies: category.technologies,
            ),
          ),
          SizedBox(
            height: mq.MediaQueryValues(context).height * 0.04,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xfff1f1f1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xffdddddd),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Infrastructure & Tools',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 7,
                  runSpacing: 7,
                  children: infrastructureTools.map(
                    (technology) {
                      final highlighted =
                          highlightedTools.contains(technology);
    
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: highlighted
                              ? Colors.black
                              : const Color(0xfff7f7f7),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: highlighted
                                ? Colors.black
                                : const Color(0xffd5d5d5),
                          ),
                        ),
                        child: Text(
                          technology,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: highlighted
                                ? Colors.white
                                : const Color(0xff333333),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),                  
              ],
            ),
          )
          // Explore the technologies, frameworks, and tools I use to design, build, and ship digital products.
        ],
      ),
    ),
  );
}              
