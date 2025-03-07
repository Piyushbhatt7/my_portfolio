import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skill_items.dart' show platformItems, skillItems;

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  ConstrainedBox(
      constraints: const BoxConstraints(
         maxWidth: 500.0,
      ),
      child: Column(
        children: [
          // paltform
          for(int i = 0; i < platformItems.length; i++)
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                leading: Image.asset(platformItems[i]["img"], width: 26.0,),
                title: Text(platformItems[i]["title"]),
              ),
            ),
          const SizedBox(height: 50.0,),
          // skills

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
          )
        ],
      ),
    );
  }
}
