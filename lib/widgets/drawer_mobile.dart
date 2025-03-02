import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  bottom: 20,
                ),
              child: IconButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  icon: const Icon(Icons.close),
              ),
            ),
          ),

          for(int i = 0; i < navIcons.length; i++)
          ListTile(
            contentPadding:  EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            titleTextStyle:  TextStyle(
              color: CustomColor.whitePrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),

        ],
      ),
    );
  }
}
