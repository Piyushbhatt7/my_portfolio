import 'package:flutter/material.dart';
import 'package:portfolio/utils/project_utils.dart';
import '../constants/colors.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatefulWidget {
  const ProjectCardWidget({
    super.key,
    required this.project
  });

  final ProjectUtils project;

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<Color?> _backgroundColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 8.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _backgroundColorAnimation = ColorTween(
      begin: CustomColor.bgLight2,
      end: CustomColor.bgLight2.withOpacity(0.8),
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

  void _onHoverChanged(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
      if (isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHoverChanged(true),
      onExit: (_) => _onHoverChanged(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _backgroundColorAnimation.value,
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.yellowPrimary.withOpacity(0.1 * _elevationAnimation.value),
                    blurRadius: _elevationAnimation.value,
                    spreadRadius: _elevationAnimation.value / 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 150,
                      width: 250,
                      child: Image.asset(
                        widget.project.image,
                        fit: BoxFit.cover,
                        scale: isHovered ? 1.1 : 1.0,
                      ),
                    ),
                  ),

                  //title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                    child: Text(
                      widget.project.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ),

                  // subtitle
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Text(
                      widget.project.subtitle,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: CustomColor.whiteSecondary,
                      ),
                    ),
                  ),
                  const Spacer(),

                  // footer
                  Container(
                    color: CustomColor.bgLight1,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                    child: Row(
                      children: [
                        const Text(
                          "Available on: ",
                          style: TextStyle(
                            color: CustomColor.yellowSecondary,
                            fontSize: 11.0,
                          ),
                        ),

                        const Spacer(),

                        if(widget.project.iosLink != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 200),
                                opacity: isHovered ? 0.8 : 1.0,
                                child: InkWell(
                                  onTap: () {
                                    js.context.callMethod("open", [widget.project.iosLink]);
                                  },
                                  child: Image.asset(
                                    "assets/ios.png",
                                    width: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        if(widget.project.androidLink != null)
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: isHovered ? 0.8 : 1.0,
                              child: InkWell(
                                onTap: () {
                                  js.context.callMethod("open", [widget.project.androidLink]);
                                },
                                child: Image.asset(
                                  "assets/android_icon.png",
                                  color: Colors.lightGreenAccent,
                                  width: 18,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
