import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    return LayoutBuilder(
        builder: (context, constraints) {
          child:
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            height: screenHeight / 1.2,
            constraints: const BoxConstraints(minWidth: 350.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // intro message
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Hii, \nI'm Piyush Bhatt\n a Flutter Developer",
                      style: TextStyle(
                        fontSize: 30,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),

                    const SizedBox(height: 15,),
                    SizedBox(
                      width: 230,
                      child: ElevatedButton(onPressed: () {

                      },
                          child: const Text("Get in touch")
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/android.png", width: screenWidth / 2, height: 160,)
              ],
            ),
          );

        }
    );

  }
}
