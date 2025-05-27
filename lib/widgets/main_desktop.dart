import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
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
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About me !",
                      style: GoogleFonts.palanquinDark(
                        color: CustomColor.yellowPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    TypingText(
                     words: ['I come from a background where the odds weren’t in favor of a tech career —'],
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      wordSpeed: const Duration(milliseconds: 80),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '''Yes, a Humanities student with no formal coding foundation. But with unwavering determination and a strong desire to learn, I stepped into the world of technology and developed the skills to build cross-platform applications for any device.

What started as curiosity has grown into a clear purpose: to build solutions that drive real-world impact. I thrive in challenging environments that push my thinking and encourage continuous growth.

With a strong foundation in Flutter development and a drive for innovation, I aim to build meaningful projects that solve problems and add value. This journey is just the beginning, and I’m committed to going even further — learning, building, and creating impact.''',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Image widget
          Expanded(
            child: SizedBox(
              height: 280,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ModelViewer(
                  src: 'assets/models/android.glb',
                  alt: "Android is Hidden in Plain Sight",
                  ar: false,
                  autoRotate: false,
                  cameraControls: true,
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
            ),
          ),
        ],
      ),
    );
  }
}
