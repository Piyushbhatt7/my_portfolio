import 'package:flutter/material.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeViewer extends StatefulWidget {
  final bool isAssets;
  const ResumeViewer({super.key, required this.isAssets});

  @override
  State<ResumeViewer> createState() => _ResumeViewerState();
}

class _ResumeViewerState extends State<ResumeViewer> {
  PDFDocument? _document;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadDocument();
  }

  Future<void> _loadDocument() async {
    try {
      PDFDocument document;
      if (widget.isAssets) {
        document = await PDFDocument.fromAsset("assets/projects/Piyush_Bhatt_Resume.pdf");
      } else {
        document = await PDFDocument.fromURL(
          'https://turquoise-merridie-57.tiiny.site/',
        );
      }
      setState(() {
        _document = document;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load resume: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _openInBrowser() async {
    final Uri url = Uri.parse('https://turquoise-merridie-57.tiiny.site/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
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
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_browser, color: Colors.white),
            onPressed: _openInBrowser,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: CustomColor.yellowPrimary),
            )
          : _error != null
              ? Center(
                  child: Text(
                    _error!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                )
              : _document != null
                  ? PDFViewer(document: _document!)
                  : const SizedBox(),
    );
  }
}
