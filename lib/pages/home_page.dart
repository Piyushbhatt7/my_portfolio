import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';
import 'package:portfolio/styles/style.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [

          // MAIN
          // HeaderDesktop(),

          Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
            decoration: kHeaderDecoration,
            child: Row(
              children: [
                SiteLogo(onTap: ()
                  {

                  },
                ),
                const Spacer(),
                IconButton(
                  onPressed: (){},
                    icon: const Icon(Icons.menu),
                ),

                const SizedBox(width: 15,),
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
}
