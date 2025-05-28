import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/sns_links.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/hero_3d_section.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/projects_section.dart';
import 'package:portfolio/widgets/skill_deskstop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';
import 'dart:js' as js;
import '../widgets/drawer_mobile.dart';
import '../constants/text_styles.dart';
import '../widgets/about_section.dart';
import '../widgets/drawer.dart';
import '../widgets/hero_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  final List<String> _sectionKeys = ['home', 'about', 'skills', 'projects', 'contact'];
  int _currentSection = 0;

  @override
  void initState() {
    super.initState();
    _itemPositionsListener.itemPositions.addListener(() {
      final positions = _itemPositionsListener.itemPositions.value;
      if (positions.isNotEmpty) {
        final firstVisibleItem = positions.first.index;
        if (_currentSection != firstVisibleItem) {
          setState(() {
            _currentSection = firstVisibleItem;
          });
        }
      }
    });
  }

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
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              :  DrawerMobile(onNavItemTap: (int navIndex)
            {
              // call function
              scaffoldKey.currentState?.closeEndDrawer();
              scrollToSection(navIndex);
            },),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                 SizedBox(key: navbarKeys.first,),
                if(constraints.maxWidth >= kMinDesktopWidth)
                  HeaderDesktop(onNavMenuTap: (int navIndex)
                    {
                      // call function
                      scrollToSection(navIndex);
                    },)
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                       scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),

                // Add the new 3D Hero Section
                const Hero3DSection(),

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
               const Footer(),
              ],
            ),
          )

      );
    }
    );
  }

  void scrollToSection(int navIndex)
  {
    if(navIndex == 4)
      {
        // open a blog page
        js.context.callMethod('open', [SnsLinks.linkdin]);
        return;
      }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
        duration: const Duration(
            milliseconds: 1200),
        curve: Curves.easeOutQuart,
    );
  }

  void _scrollToSection(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }
}

