import 'package:flutter/material.dart';
import 'package:portfolio/widgets/site_logo.dart';

import '../styles/style.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
    );
  }
}
