import 'package:flutter/material.dart';
import 'package:portfolio/widgets/project_card.dart';

import '../constants/colors.dart';
import '../utils/project_utils.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return   // PROJECTS
      Container(
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
            ),

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
                    ),
                ],
              ),
            ),

            const SizedBox(height: 80,),


            // hobby projects title
            const Text("Hobby Projects",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              ),
            ),

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
                    ),
                ],
              ),
            )
          ],
        ),

      );
  }
}
