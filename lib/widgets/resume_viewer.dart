import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ResumeViewer extends StatefulWidget {
  final bool isAssets;
  const ResumeViewer({super.key, required this.isAssets});

  @override
  State<ResumeViewer> createState() => _ResumeViewerState();
}

class _ResumeViewerState extends State<ResumeViewer> {
  late PdfViewerController _pdfViewerController;
  double _currentZoomLevel = 1.0;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
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
          // Open in browser button
          IconButton(
            icon: const Icon(Icons.open_in_browser, color: Colors.white),
            onPressed: _openInBrowser,
          ),
          // Zoom out button
          IconButton(
            icon: const Icon(Icons.zoom_out, color: Colors.white),
            onPressed: () {
              _pdfViewerController.zoomLevel = _currentZoomLevel - 0.25;
              setState(() {
                _currentZoomLevel = _pdfViewerController.zoomLevel;
              });
            },
          ),
          // Zoom in button
          IconButton(
            icon: const Icon(Icons.zoom_in, color: Colors.white),
            onPressed: () {
              _pdfViewerController.zoomLevel = _currentZoomLevel + 0.25;
              setState(() {
                _currentZoomLevel = _pdfViewerController.zoomLevel;
              });
            },
          ),
        ],
      ),
      body: Stack(
  children: [
    if (widget.isAssets)
      const PDF().fromAsset(
        'assets/resume.pdf',
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => Center(child: Text(error.toString())),
      )
    else
      const PDF().cachedFromUrl(
        'https://drive.google.com/file/d/1w-qYKf5k3J5c3E57gpuzmeBg4rT38lwj/view?usp=sharing',
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => Center(child: Text(error.toString())),
      ),

    // Loading Indicator
    if (_isLoading)
      const Center(
        child: CircularProgressIndicator(
          color: CustomColor.yellowPrimary,
        ),
      ),

    // Error message handling (optional for local asset, more relevant for URL)
    if (_error != null)
      // your error widget...
      const SizedBox(),

    // Zoom level indicator (not functional for asset view using flutter_cached_pdfview)
    if (!_isLoading && _error == null && !widget.isAssets)
      Positioned(
        bottom: 16,
        right: 16,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: CustomColor.bgLight1.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${(_currentZoomLevel * 100).toStringAsFixed(0)}%',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
  ],
),

    );
  }
}
