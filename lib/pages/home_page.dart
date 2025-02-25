import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/styles/style.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
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

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                height: screenSize.height/1.2,
                constraints: BoxConstraints(minHeight: 350),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Hii, \nI'am Piyush Bhatt\n a Flutter Developer"),
                        ElevatedButton(onPressed: ()
                            {
                              
                            },
                            child: const Text("Get in touch")
                        )
                      ],
                    ),
                    Image.asset("assets/android.png", width: screenWidth/2, height: 160,)
                  ],
                ),
              ),

              // SKILLS
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
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
