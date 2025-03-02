import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title
          Text("Get in touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),),

          const SizedBox(height: 50.0,),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child:
          ),

          const SizedBox(height: 15.0,),
          // message
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 700
            ),
            child: CustomTextField(
              hintText: "Your message",
              maxLine: 15,
            ),
          ),
          const SizedBox(height: 20.0,),

          // send button
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 700
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.yellowPrimary,
                    foregroundColor: CustomColor.whitePrimary,
                  ),

                  child: Text("Get in touch")
              ),
            ),
          ),

          const SizedBox(height: 30,),

          ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 300
              ),
              child: const Divider()
          ),
          const SizedBox(height: 15,),
          // SNS icon button liks

          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                  onTap: (){},
                  child: Image.asset(
                    "assets/social/link-din.png",
                    width: 32,
                  )),

              InkWell(
                  onTap: (){},
                  child: Image.asset(
                    "assets/social/github.png",
                    width: 32,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Row buildnameEmailFieldDesktop() {
    return Row(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            hintText: "Your name",
          ),
        ),
        const SizedBox(width: 15.0,),
        // email
        Flexible(
          child: CustomTextField(
            hintText: "Your email",
          ),
        ),
      ],
    );
  }
}
