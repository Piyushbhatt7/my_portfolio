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

                    // platorm and skill

                    Row(
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
                              Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  color: CustomColor.bgLight2,
                                  borderRadius: BorderRadius.circular(5),
                                ),

                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  leading: Image.asset(platformItems[i]["img"], width: 35, height: 40,),
                                  title: Text(platformItems[i]["title"]),
                                 ),
                              )
                            ],
                          ),
                        ),

                       const SizedBox(width: 50.0,),
                        // skills


                      ],
                    )
                  ],
                ),
              ),

              // PROJECTS
              Container(
                height: 500,
                width: double.maxFinite,

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
