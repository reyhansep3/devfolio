import 'package:flutter/material.dart';
import 'package:flutter_portofolio/model/skills_model.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
import 'package:flutter_portofolio/view/widgets/constant.dart';
import 'package:google_fonts/google_fonts.dart';

List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 80,
  ),
  Skill(
    skill: "C++",
    percentage: 50,
  ),
  Skill(
    skill: "PHP",
    percentage: 40,
  ),
  Skill(
    skill: "HTML",
    percentage: 30,
  ),
  Skill(
    skill: "Python",
    percentage: 60,
  ),
  Skill(
    skill: "GoLang",
    percentage: 35,
  ),
];

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Responsivelayout(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            // maxWidth: width,
            // minWidth: width,
            child: Flex(
              direction: Responsivelayout.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: Responsivelayout.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SKILLS",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "This is all the skills listed below more will be added in due time. This is all the skills listed below more will be added in due time.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                                margin: const EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: skill.percentage,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        alignment: Alignment.centerLeft,
                                        height: 38.0,
                                        color: Colors.white,
                                        child: Text(skill.skill),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      // remaining (blank part)
                                      flex: 100 - skill.percentage,
                                      child: const Divider(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${skill.percentage}%",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}