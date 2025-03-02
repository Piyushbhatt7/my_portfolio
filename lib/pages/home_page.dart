import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/projects_section.dart';
import 'package:portfolio/widgets/skill_deskstop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

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
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                 SizedBox(key: navbarKeys.first,),
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
                  key: navbarKeys[1],
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

                const SizedBox(height: 30.0,),
                // PROJECTS
                ProjectsSection(key: navbarKeys[2],),
                const SizedBox(height: 30.0,),

                // CONTACT
                ContactSection(key: navbarKeys[3],),
                const SizedBox(height: 30.0,),

                // FOOTER
                Footer(),
              ],
            ),
          )

      );
    }
    );
  }


}

