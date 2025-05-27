import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:typing_text/typing_text.dart';

import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minWidth: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// ✅ Wrap the column with `Expanded` to provide bounded width
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start, // optional
              children: [
                TypingText(
                  words: const ['I am a Android Developer'],
                  style: GoogleFonts.zillaSlab(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                  letterSpeed: const Duration(milliseconds: 100),
                ),
                // const SizedBox(height: 10),

                // TypingText(
                //   words: const ['Android Developer'],
                //   style: GoogleFonts.poppins(
                //     fontSize: 32,
                //     fontWeight: FontWeight.bold,
                //     color: CustomColor.whitePrimary,
                //   ),
                //   letterSpeed: const Duration(milliseconds: 100),
                // ),

                const SizedBox(height: 15),

                SizedBox(
                  width: 230,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContactSection()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.yellowPrimary,
                      foregroundColor: CustomColor.whitePrimary,
                    ),
                    child: const Text("Get in touch"),
                  ),
                ),
              ],
            ),
          ),

          // Image widget
          Image.asset(
            "assets/android.png",
            width: screenWidth / 2,
            height: 200,
          ),
        ],
      ),
    );
  }
}
