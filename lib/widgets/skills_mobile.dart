import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skill_items.dart' show skillItems;

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  // skills

      Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        alignment: WrapAlignment.center,
        children: [
          for(int i = 0; i < skillItems.length; i++)
            Chip(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              backgroundColor: CustomColor.bgLight2,
              label: Text(skillItems[i]["title"]),
              avatar: Image.asset(skillItems[i]["img"]),
            ),
        ],
      );
  }
}
