import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../constants/colors.dart';
import '../utils/project_utils.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return VisibilityDetector(
      key: const Key('projects_section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
        child: Column(
          children: [
            // work projects title
            const Text("Work Projects",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              ),
            ).animate(
              target: _isVisible ? 1 : 0,
            )
              .fadeIn(duration: const Duration(milliseconds: 800))
              .slideY(begin: 0.4, end: 0, curve: Curves.easeOutQuart)
              .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),

            const SizedBox(height: 40,),
            // work projects cards
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 900,
              ),
              child: Wrap(
                spacing: 25,
                runSpacing: 25,
                children: [
                  for(int i = 0; i < workProjectUtils.length; i++)
                    ProjectCardWidget(
                      project: workProjectUtils[i],
                    ).animate(
                      target: _isVisible ? 1 : 0,
                    )
                      .fadeIn(delay: Duration(milliseconds: 300 * i))
                      .slideX(begin: 0.3, end: 0, curve: Curves.easeOutQuart)
                      .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
                ],
              ),
            ),

            const SizedBox(height: 60,),

            // hobby projects title
            const Text("Hobby Projects",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              ),
            ).animate(
              target: _isVisible ? 1 : 0,
            )
              .fadeIn(duration: const Duration(milliseconds: 800))
              .slideY(begin: 0.4, end: 0, curve: Curves.easeOutQuart)
              .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),

            const SizedBox(height: 40,),
            // hobby projects cards
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 900,
              ),
              child: Wrap(
                spacing: 25,
                runSpacing: 25,
                children: [
                  for(int i = 0; i < hobbyProjectUtils.length; i++)
                    ProjectCardWidget(
                      project: hobbyProjectUtils[i],
                    ).animate(
                      target: _isVisible ? 1 : 0,
                    )
                      .fadeIn(delay: Duration(milliseconds: 300 * i))
                      .slideX(begin: 0.3, end: 0, curve: Curves.easeOutQuart)
                      .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
