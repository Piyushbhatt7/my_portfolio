import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../constants/colors.dart';
import '../constants/skill_items.dart' show platformItems, skillItems;

class SkillsMobile extends StatefulWidget {
  const SkillsMobile({super.key});

  @override
  State<SkillsMobile> createState() => _SkillsMobileState();
}

class _SkillsMobileState extends State<SkillsMobile> {
  bool _isVisible = false;
  final List<bool> _platformHoverStates = List.generate(platformItems.length, (_) => false);
  final List<bool> _skillHoverStates = List.generate(skillItems.length, (_) => false);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return VisibilityDetector(
      key: const Key('skills_mobile_section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Skills",
              style: GoogleFonts.palanquinDark(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: CustomColor.yellowPrimary,
              ),
            ),
            const SizedBox(height: 20),
            // platform
            for(int i = 0; i < platformItems.length; i++)
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _platformHoverStates[i] = true),
                onExit: (_) => setState(() => _platformHoverStates[i] = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  width: double.maxFinite,
                  transform: Matrix4.identity()..scale(_platformHoverStates[i] ? 1.02 : 1.0),
                  transformAlignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.yellowPrimary.withOpacity(_platformHoverStates[i] ? 0.3 : 0.1),
                        blurRadius: _platformHoverStates[i] ? 10 : 5,
                        spreadRadius: _platformHoverStates[i] ? 2 : 0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                    leading: Image.asset(
                      platformItems[i]["img"],
                      width: screenWidth * 0.06,
                      height: screenWidth * 0.06,
                      fit: BoxFit.contain,
                    ),
                    title: Text(
                      platformItems[i]["title"],
                      style: GoogleFonts.openSans(
                        fontSize: screenWidth * 0.04,
                        color: CustomColor.whitePrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ).animate(
                target: _isVisible ? 1 : 0,
              )
                .fadeIn(delay: Duration(milliseconds: 200 * i))
                .slideX(begin: -0.2, end: 0, curve: Curves.easeOutQuart)
                .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1))
                .then()
                .shimmer(duration: const Duration(seconds: 2), color: CustomColor.yellowPrimary.withOpacity(0.3)),

            const SizedBox(height: 40.0),
            Text(
              "Technologies",
              style: GoogleFonts.palanquinDark(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: CustomColor.yellowPrimary,
              ),
            ),
            const SizedBox(height: 20),
            // skills
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.start,
              children: [
                for(int i = 0; i < skillItems.length; i++)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => setState(() => _skillHoverStates[i] = true),
                    onExit: (_) => setState(() => _skillHoverStates[i] = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: Matrix4.identity()..scale(_skillHoverStates[i] ? 1.1 : 1.0),
                      transformAlignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight2,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColor.yellowPrimary.withOpacity(_skillHoverStates[i] ? 0.3 : 0.1),
                            blurRadius: _skillHoverStates[i] ? 10 : 5,
                            spreadRadius: _skillHoverStates[i] ? 2 : 0,
                          ),
                        ],
                      ),
                      child: Chip(
                        padding: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.02,
                          horizontal: screenWidth * 0.03,
                        ),
                        backgroundColor: Colors.transparent,
                        label: Text(
                          skillItems[i]["title"],
                          style: GoogleFonts.openSans(
                            fontSize: screenWidth * 0.035,
                            color: CustomColor.whitePrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        avatar: Image.asset(
                          skillItems[i]["img"],
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.05,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ).animate(
                    target: _isVisible ? 1 : 0,
                  )
                    .fadeIn(delay: Duration(milliseconds: 300 * i))
                    .slideX(begin: 0.2, end: 0, curve: Curves.easeOutQuart)
                    .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1))
                    .then()
                    .shimmer(duration: const Duration(seconds: 2), color: CustomColor.yellowPrimary.withOpacity(0.3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

