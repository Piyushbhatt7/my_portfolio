import 'package:flutter/material.dart';
import 'package:portfolio/utils/project_utils.dart';
import '../constants/colors.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project
  });

final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: CustomColor.bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
          project.image,
            height: 140,
            width: 250,
            fit: BoxFit.cover,
          ),

          //title

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(project.title, style:
            const TextStyle(
              fontWeight: FontWeight.w600,
              color: CustomColor.whitePrimary,
            ),),
          ),

          // subtitle

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(project.subtitle, style:
            const TextStyle(
              fontSize: 10.0,
              color: CustomColor.whiteSecondary,
            ),),
          ),
          const Spacer(),

          // footer

          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: Row(
              children: [
               const Text("Available on: ",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 11.0,
                  ),),

                const Spacer(),

                if(project.iosLink != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: InkWell(
                      onTap: ()
                      {
                         js.context.callMethod("open", [project.iosLink]);
                      },
                      child: Image.asset(
                        "assets/ios.png",
                        width: 13,
                      )),
                ),

                if(project.androidLink != null)
                InkWell(
                    onTap: ()
                    {
                      js.context.callMethod("open", [project.androidLink]);
                    },
                    child: Image.asset(
                      "assets/android_icon.png",
                      width: 18,)),

              ],
            ),
          )
        ],
      ),
    );
  }
}
