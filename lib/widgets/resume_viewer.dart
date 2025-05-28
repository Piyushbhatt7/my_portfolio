import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/constants/colors.dart';

class ResumeViewer extends StatelessWidget {
  const ResumeViewer({super.key});

  Future<void> _openInBrowser(BuildContext context) async {
    final Uri url = Uri.parse('https://drive.google.com/file/d/1w-qYKf5k3J5c3E57gpuzmeBg4rT38lwj/view'); // Direct PDF link!

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open resume in browser'),
            backgroundColor: CustomColor.bgLight1,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      appBar: AppBar(
        title: const Text('My Resume', style: TextStyle(color: Colors.white)),
        backgroundColor: CustomColor.bgLight1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => _openInBrowser(context),
          icon: const Icon(Icons.picture_as_pdf),
          label: const Text('Open Resume PDF'),
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColor.yellowPrimary,
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
