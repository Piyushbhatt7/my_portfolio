import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../constants/colors.dart';
import '../constants/skill_items.dart';

class SkillDeskstop extends StatefulWidget {
  const SkillDeskstop({super.key});

  @override
  State<SkillDeskstop> createState() => _SkillDeskstopState();
}

class _SkillDeskstopState extends State<SkillDeskstop> {
  bool _isVisible = false;
  final List<bool> _platformHoverStates = List.generate(platformItems.length, (_) => false);
  final List<bool> _skillHoverStates = List.generate(skillItems.length, (_) => false);

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('skills_section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // platforms
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 450
            ),
            child: Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: [
                for(int i = 0; i < platformItems.length; i++)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => setState(() => _platformHoverStates[i] = true),
                    onExit: (_) => setState(() => _platformHoverStates[i] = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 200,
                      transform: Matrix4.identity()..scale(_platformHoverStates[i] ? 1.05 : 1.0),
                      transformAlignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight2,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColor.yellowPrimary.withOpacity(_platformHoverStates[i] ? 0.3 : 0.1),
                            blurRadius: _platformHoverStates[i] ? 10 : 5,
                            spreadRadius: _platformHoverStates[i] ? 2 : 0,
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        leading: Image.asset(platformItems[i]["img"], width: 35, height: 40,),
                        title: Text(
                          platformItems[i]["title"],
                          style: const TextStyle(
                            color: CustomColor.whitePrimary,
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
              ],
            ),
          ),

          const SizedBox(width: 50.0,),
          // skills
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
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
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          backgroundColor: Colors.transparent,
                          label: Text(
                            skillItems[i]["title"],
                            style: const TextStyle(
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                          avatar: Image.asset(skillItems[i]["img"]),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
