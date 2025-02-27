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
    image: 'assets/projects/logolove.png',
    title: "Soul-Mingle (Dating App)",
    subtitle: "This is a Dating Application connects users having real time like and profile features",
    androidLink: 'https://github.com/Piyushbhatt7?tab=repositories',
  ),

  ProjectUtils(
    image: 'assets/projects/mainlogo.png',
    title: ,
    subtitle: ,
    androidLink: ,
  ),
];

}