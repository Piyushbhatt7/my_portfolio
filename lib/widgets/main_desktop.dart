import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:typing_text/typing_text.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Me",
                      style: GoogleFonts.palanquinDark(
                        color: CustomColor.yellowPrimary,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: -0.2, end: 0),
                    const SizedBox(height: 20),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: CustomColor.bgLight2.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: CustomColor.yellowPrimary.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TypingText(
                              words: ['From Humanities to Tech: My Journey'],
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: CustomColor.yellowPrimary,
                                letterSpacing: 0.5,
                              ),
                              wordSpeed: const Duration(milliseconds: 80),
                            )
                            .animate()
                            .fadeIn(delay: 200.ms)
                            .slideX(begin: -0.2, end: 0),
                            const SizedBox(height: 15),
                            Text(
                              '''I come from a background where the odds weren't in favor of a tech career — a Humanities student with no formal coding foundation. But with unwavering determination and a strong desire to learn, I stepped into the world of technology and developed the skills to build cross-platform applications for any device.''',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.6,
                                letterSpacing: 0.3,
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 400.ms)
                            .slideX(begin: -0.2, end: 0),
                            const SizedBox(height: 20),
                            Text(
                              'My Mission',
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: CustomColor.yellowPrimary,
                                letterSpacing: 0.5,
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 600.ms)
                            .slideX(begin: -0.2, end: 0),
                            const SizedBox(height: 15),
                            Text(
                              '''What started as curiosity has grown into a clear purpose: to build solutions that drive real-world impact. I thrive in challenging environments that push my thinking and encourage continuous growth.''',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.6,
                                letterSpacing: 0.3,
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 800.ms)
                            .slideX(begin: -0.2, end: 0),
                            const SizedBox(height: 20),
                            Text(
                              'Looking Forward',
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: CustomColor.yellowPrimary,
                                letterSpacing: 0.5,
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 1000.ms)
                            .slideX(begin: -0.2, end: 0),
                            const SizedBox(height: 15),
                            Text(
                              '''With a strong foundation in Flutter development and a drive for innovation, I aim to build meaningful projects that solve problems and add value. This journey is just the beginning, and I'm committed to going even further — learning, building, and creating impact.''',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.6,
                                letterSpacing: 0.3,
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 1200.ms)
                            .slideX(begin: -0.2, end: 0),
                          ],
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 200.ms)
                    .scale(
                      begin: const Offset(0.95, 0.95),
                      end: const Offset(1, 1),
                      duration: 600.ms,
                      curve: Curves.easeOutQuart,
                    )
                    .then()
                    .shimmer(
                      duration: 1200.ms,
                      color: CustomColor.yellowPrimary.withOpacity(0.3),
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
            )
            .animate()
            .fadeIn(delay: 400.ms)
            .scale(
              begin: const Offset(0.9, 0.9),
              end: const Offset(1, 1),
              duration: 800.ms,
              curve: Curves.easeOutQuart,
            ),
          ),
        ],
      ),
    );
  }
}
