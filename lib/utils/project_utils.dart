class ProjectUtils {

  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}
  // HOBBY PROJECTS 

List<ProjectUtils> hobbyProjectUtils = [

  ProjectUtils(
    image: "assets/social/insta.png",
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
    image: "assets/projects/dsa-java.webp",
    title: "DSA - JAVA",
    subtitle: "This is I try to cover the DSA concepts in JAVA",
    androidLink: "https://github.com/Piyushbhatt7/Advanced-Java",
  ),      
 
];                                                 

List<ProjectUtils> workProjectUtils = [

  ProjectUtils( 
    image: "assets/projects/hero_image.png",
    title: "DocBoard",
    subtitle: "This Word Proccessing Application helps users to create, edit and manage documents",
    androidLink: "https://github.com/Piyushbhatt7/DocBoard-",
  ),

  ProjectUtils(
    image: "assets/projects/logo.png",
    title: "Housify (Room Renting App)",
    subtitle: "Housify is a Room Renting Application that helps users to find rooms for rent",
    androidLink: "https://github.com/Piyushbhatt7/housify_app",
  ),

   ProjectUtils(
    image: "assets/projects/per.jpg",
    title: "Perplexity Clone",
    subtitle: "This project work same as a Perplexity AI",
    androidLink: "https://github.com/Piyushbhatt7/Perplexity-Clone",
  ),

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
    image: "assets/projects/bmi.jpg",
    title: "BMI - Calculator",
    subtitle: "This is a flutter base Body Mass Index Calculator",
    androidLink: "https://github.com/Piyushbhatt7/BMI-Calculator-using-flutter",
  ),


];



 