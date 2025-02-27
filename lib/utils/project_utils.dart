class ProjectUtils {

  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils ({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
});
  // HOBBY PROJECTS

List<ProjectUtils> hobbyProjectUtils = [

  ProjectUtils(
    image: "assets/projects/logolove.png",
    title: "Soul-Mingle (Dating App)",
    subtitle: "This is a Dating Application connects users having real time like and profile features",
    androidLink: "https://github.com/Piyushbhatt7/Dating-Application",
  ),

  ProjectUtils(
    image: "assets/projects/mainlogo.png",
    title: "Foodie (Food Delivery App)",
    subtitle: "This is a Food Delivey App provides food in minutes",
    androidLink: "https://github.com/Piyushbhatt7/Food_Delivery_App",
  ),

  ProjectUtils(
    image: "assets/projects/instalogo.png ",
    title: "Instagram Clone",
    subtitle: "This is a Instagram Frontend App",
    androidLink: "https://github.com/Piyushbhatt7/Instagram-Clone",
  ),

  ProjectUtils(
    image: "assets/projects/whatsapp.png",
    title: "WhatApp Clone",
    subtitle: "This is a WhatsApp Clone",
    androidLink: "https://github.com/Piyushbhatt7/WhatsApp-Ui",
  ),
];

}