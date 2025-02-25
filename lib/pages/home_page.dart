import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/styles/style.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
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

              // const MainDesktop(),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                height: screeenHeight,
                constraints: BoxConstraints(minHeight: 560),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // avatar img
                    ShaderMask(
                      shaderCallback: (bounds)
                    {
                       return LinearGradient(
                       colors: [
                         CustomColor.scaffoldBg.withOpacity(0.6),
                         CustomColor.scaffoldBg.withOpacity(0.6),
                       ]
                       ).createShader(bounds);
                    },
                        blendMode: BlendMode.srcATop,
                        child: Image.asset(
                          "assets/android.png",
                          width: screenWidth,
                          height: 190,
                        )
                    ),
                    // intro text

                    const SizedBox(height: 15,),

                    const Text("Hii, \nI'm Piyush Bhatt\n a Flutter Developer",
                      style: TextStyle(
                        fontSize: 24,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),

                    const SizedBox(height: 15,),

                    // contact btn
                    SizedBox(
                      width: 190,
                      child: ElevatedButton(onPressed: () {

                      },
                          child: const Text("Get in touch")
                      ),
                    ),
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
