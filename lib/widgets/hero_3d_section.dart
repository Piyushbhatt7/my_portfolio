import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:typing_text/typing_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:portfolio/widgets/resume_viewer.dart';

class Hero3DSection extends StatefulWidget {
  const Hero3DSection({super.key});

  @override
  State<Hero3DSection> createState() => _Hero3DSectionState();
}

class _Hero3DSectionState extends State<Hero3DSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          // 3D Model Viewer
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
                    src: 'assets/models/ai_model.glb',
                    alt: "AI is Hidden in Plain Sight",
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
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Image with 3D effect
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
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
                      ),
                    );
                  },
                ).animate()
                  .fadeIn(duration: const Duration(seconds: 1))
                  .scale(
                    begin: const Offset(0.5, 0.5),
                    end: const Offset(1.0, 1.0),
                    duration: const Duration(seconds: 1),
                  )
                  .then()
                  .shimmer(duration: const Duration(seconds: 2)),

                const SizedBox(height: 30),
                Text(
                  'Hii, Myself',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: CustomColor.whitePrimary,
                  ),
                ).animate().fadeIn(duration: const Duration(seconds: 1)),

                Padding(
                  padding: const EdgeInsets.only(left: 550.0,),
                  child: TypingText(
                    letterSpeed: const Duration(milliseconds: 200),
                    words: ['Piyush Bhatt'],
                    style: GoogleFonts.aBeeZee(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.yellowPrimary,
                    ),
                  ).animate()
                  .fadeIn(
                    duration: const Duration(
                      seconds: 1),
                  ),
                ),


                 Padding(
                   padding: const EdgeInsets.only(left: 600.0),
                   child: TypingText(
                    wordSpeed: const Duration(milliseconds: 100),
                     words: ['I am a'],
                     style: GoogleFonts.actor(
                       fontSize: 25,
                       fontWeight: FontWeight.bold,
                       color: CustomColor.whitePrimary,
                     ),
                   ).animate()
                   .fadeIn(
                     duration: const Duration(
                       seconds: 1),
                   ),
                 ),

                  Padding(
                    padding: const EdgeInsets.only(left: 470.0),
                    child: TypingText(
                      wordSpeed: const Duration(microseconds: 150),
                      words: ['Web and Android Developer'],
                      style: GoogleFonts.architectsDaughter(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.yellowPrimary,
                      ),
                    ).animate()
                    .fadeIn(
                      duration: const Duration(
                        seconds: 1),
                    ),
                  ),

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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CustomColor.yellowPrimary,
                              CustomColor.yellowPrimary.withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColor.yellowPrimary.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Text(
                          'View Resume',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 
