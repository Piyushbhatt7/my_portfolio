

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
  });

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
          Image.asset("assets/projects/logolove.png",
            height: 140,
            width: 250,
            fit: BoxFit.cover,
          ),

          //title

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text("Title", style: TextStyle(
              fontWeight: FontWeight.w600,
              color: CustomColor.whitePrimary,
            ),),
          ),

          // subtitle

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text("Dummy title", style: TextStyle(
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
                Text("Available on: ",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 11.0,
                  ),),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: InkWell(
                      onTap: ()
                      {

                      },
                      child: Image.asset(
                        "assets/ios.png",
                        width: 13,
                      )),
                ),
                InkWell(
                    onTap: ()
                    {

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
