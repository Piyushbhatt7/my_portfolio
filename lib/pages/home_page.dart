import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/skill_items.dart';
import 'package:portfolio/styles/style.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/site_logo.dart';
import 'package:portfolio/widgets/skill_deskstop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screeenHeight = screenSize.height;
    return LayoutBuilder(
      builder: (context, constraints)
    {
      child:
      return Scaffold(
        key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          //endDrawer: constraints.maxWidth >= kMinDesktopWidth ? null : const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [

              // MAIN
/*

              if(constraints.maxWidth >= kMinDesktopWidth)
                const HeaderDesktop() else
                HeaderMobile(
                  onLogoTap: () {

                  },
                  onMenuTap: () {
                     scaffoldKey.currentState?.openEndDrawer();
                  },
                ),

              if(constraints.maxWidth >= kMinDesktopWidth)
              const MainDesktop() else const MainMobile(),



              // SKILLS
              Container(

                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // title
                  const Text("What I can do",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                    ),

                  const  SizedBox(height: 50.0,),

                    // platorm and skill

                    if(constraints.maxWidth >= kMedDesktopWidth)
                    const SkillDeskstop()
                    else
                    const SkillsMobile()

                ],
                ),
              ),
*/

              // PROJECTS
              Container(
                width: screenWidth,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),

                child: Column(

                  children: [
                    // work projects title
                    const Text("Work Projects",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),


                    // work projects cards
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 280,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CustomColor.bgLight2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            Image.asset("assets/projects/logolove.png",
                              height: 140,
                              width: 250,
                              fit: BoxFit.cover,
                            ),

                          //title

                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                            child: Text("Title", style: TextStyle(
                              fontWeight: FontWeight.w600,
                                color: CustomColor.whitePrimary,
                            ),),
                          ),

                          // subtitle

                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                            child: Text("Dummy title", style: TextStyle(
                              fontSize: 10.0,
                              color: CustomColor.whiteSecondary,
                            ),),
                          ),
                          const Spacer(),

                          // footer

                          Container(
                            color: CustomColor.bgLight1,
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                            child: Row(
                              children: [
                                 Text("Available on: ",
                                   style: TextStyle(
                                     color: CustomColor.yellowSecondary,
                                     fontSize: 11.0,
                                 ),),

                                const Spacer(),

                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Image.asset("assets/ios.png", width: 13,),
                                ),
                                Image.asset("assets/android_icon.png", width: 18,),

                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),

              ),


              // CONTACT
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),

              // FOOTER
              Container(
                height: 500,
                width: double.maxFinite,

              ),
            ],
          )

      );
    }

    );
  }
}
