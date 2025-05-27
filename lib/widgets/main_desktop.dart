import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
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
                    onPressed: () {},
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
         ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ModelViewer(
                    src: 'assets/models/android.glb',
                    alt: "Android is Hidden in Plain Sight",
                    ar: false, 
                    autoRotate: true, 
                    cameraControls: false,       
                    backgroundColor: Colors.transparent,               
                    exposure: 1,
                    shadowIntensity: 1,
                    shadowSoftness: 1,
                    cameraOrbit: '0deg 75deg 105%',
                    interactionPrompt: InteractionPrompt.none,
                    interactionPromptStyle: InteractionPromptStyle.basic,
                    reveal: Reveal.auto,
                    arModes: const [],
                    arScale: ArScale.fixed,
                    autoPlay: true,
                    rotationPerSecond: "30deg",
                    minCameraOrbit: "auto auto 50%",
                    maxCameraOrbit: "auto auto 150%",
                    minFieldOfView: "30deg",
                    maxFieldOfView: "90deg",
                    interpolationDecay: 200,
                    touchAction: TouchAction.none,
                    disableZoom: true,
                    disablePan: true,
                    disableTap: true,
                    loading: Loading.eager,
                  ),
                ),
        ],
      ),
    );
  }
}
