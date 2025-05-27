import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:typing_text/typing_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:portfolio/widgets/resume_viewer.dart';

class Hero3DSection extends StatelessWidget {
  const Hero3DSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColor.scaffoldBg,
            CustomColor.bgLight1,
          ],
        ),
      ),
      child: Stack(
        children: [
          // 3D Model Viewer (GLB/GLTF)
          Positioned(
            top: 40,
            left: 40,
            child: MouseRegion(
              cursor: SystemMouseCursors.move,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.whitePrimary.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ModelViewer(
                    src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                    alt: "A 3D model of an astronaut",
                    ar: false,
                    autoRotate: true,
                    cameraControls: true,
                    backgroundColor: Colors.transparent,
                    exposure: 1,
                    shadowIntensity: 1,
                    shadowSoftness: 1,
                    cameraOrbit: '0deg 75deg 105%',
                    interactionPrompt: InteractionPrompt.auto,
                    interactionPromptStyle: InteractionPromptStyle.basic,
                    reveal: Reveal.interaction,
                    arModes: const ['webxr', 'scene-viewer', 'quick-look'],
                    arScale: ArScale.fixed,
                  ),
                ),
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Image with 3D effect
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.whitePrimary.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/profile.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ).animate()
                  .fadeIn(duration: const Duration(seconds: 1))
                  .scale(
                    begin: const Offset(0.5, 0.5),
                    end: const Offset(1.0, 1.0),
                    duration: const Duration(seconds: 1),
                  ),

                const SizedBox(height: 30),

                // Typing Text Animation using typing_text
                // TypingText(
                //   words: const ['Android Developer'],
                //   style: GoogleFonts.poppins(
                //     fontSize: 32,
                //     fontWeight: FontWeight.bold,
                //     color: CustomColor.whitePrimary,
                //   ),
                //   letterSpeed: const Duration(milliseconds: 100),
                // ),

                const SizedBox(height: 20),

                // Resume Button with Hover Effect
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResumeViewer(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CustomColor.whitePrimary,
                            CustomColor.whitePrimary.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColor.whitePrimary.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Text(
                        'View Resume',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomColor.scaffoldBg,
                        ),
                      ),
                    ).animate()
                      .fadeIn(duration: const Duration(seconds: 1))
                      .scale(
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1.0, 1.0),
                        duration: const Duration(seconds: 1),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 