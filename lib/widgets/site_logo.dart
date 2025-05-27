import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {


    return  GestureDetector(
      onTap: onTap,
      child: Text(
        "Portfolio",
        style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            //decoration: TextDecoration.underline,
            color: Color.fromARGB(255, 245, 164, 24)
        ),),
    );
  }
}
