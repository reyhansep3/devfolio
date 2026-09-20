import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechnologyStack extends StatelessWidget {
  const TechnologyStack({
    super.key,
    required this.technologies,
  });

  final List<String> technologies;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'Technology Stack',
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
            children: technologies.map(
              (technology) {
                final isHighlighted = [
                  'Flutter',
                  'React',
                  'React Native',
                  'TypeScript',
                  'Laravel',
                  'TailwindCSS',
                ].contains(technology);
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isHighlighted
                        ? Colors.black
                        : const Color(0xfff7f7f7),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: isHighlighted
                          ? Colors.black
                          : const Color(0xffd5d5d5),
                    ),
                  ),
                  child: Text(
                    technology,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: isHighlighted
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
    );
  }
}