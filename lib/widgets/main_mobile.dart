import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      height: screenHeight,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar img
          ShaderMask(
              shaderCallback: (bounds)
              {
                return LinearGradient(
                    colors: [
                      CustomColor.scaffoldBg.withOpacity(0.6),
                      CustomColor.scaffoldBg.withOpacity(0.6),
                    ]
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                "assets/android.png",
                width: screenWidth,
                height: 190,
              )
          ),
          // intro text

          const SizedBox(height: 30,),

          const Text("Hii, \nI'm Piyush Bhatt\n a Flutter Developer",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 15,),

          // contact btn
          SizedBox(
            width: 190,
            child: ElevatedButton(onPressed: () {

            },
                child: const Text("Get in touch") //15:01
            ),
          ),
        ],
      ),
    );
  }
}
