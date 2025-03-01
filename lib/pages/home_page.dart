import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/skill_items.dart';
import 'package:portfolio/styles/style.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/site_logo.dart';
import 'package:portfolio/widgets/skill_deskstop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';

import '../widgets/project_card.dart';

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
     // child:
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

                  const SizedBox(height: 40,),
                    // work projects cards
                   ConstrainedBox(
                     constraints: BoxConstraints(
                       maxWidth: 800,
                     ),
                     child: Wrap(
                       spacing: 25,
                       runSpacing: 25,
                       children: [
                         for(int i = 0; i < workProjectUtils.length; i++)
                         ProjectCardWidget(
                             project: workProjectUtils[i],
                         ),
                       ],
                     ),
                   ),

                    const SizedBox(height: 80,),


                    // hobby projects title
                    const Text("Hobby Projects",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),

                    const SizedBox(height: 40,),
                    // hobby projects cards
                    ConstrainedBox(
                      constraints: BoxConstraints(

                      ),
                      child: Wrap(
                        spacing: 25,
                        runSpacing: 25,
                        children: [
                          for(int i = 0; i < hobbyProjectUtils.length; i++)
                            ProjectCardWidget(
                              project: hobbyProjectUtils[i],
                            ),
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

