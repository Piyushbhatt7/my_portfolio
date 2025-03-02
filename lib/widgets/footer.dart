import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text("Made by Piyush Bhatt with Flutter 3.29",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: CustomColor.whiteSecondary,
        ),
      ),

    );
  }
}
