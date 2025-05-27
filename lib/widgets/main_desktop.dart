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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start, // optional
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text("About me",
                  style: GoogleFonts.palanquinDark(
                    color: Colors.yellow
                    ),
                  ),
                ),

              
                

                const SizedBox(height: 15),
              ],
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
