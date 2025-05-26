import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:portfolio/constants/colors.dart';

class ResumeViewer extends StatefulWidget {
  const ResumeViewer({super.key});

  @override
  State<ResumeViewer> createState() => _ResumeViewerState();
}

class _ResumeViewerState extends State<ResumeViewer> {
  late PdfViewerController _pdfViewerController;
  double _currentZoomLevel = 1.0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      appBar: AppBar(
        title: const Text(
          'My Resume',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CustomColor.bgLight1,
        actions: [
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
          // Download button
          IconButton(
            icon: const Icon(Icons.download, color: Colors.white),
            onPressed: () {
              // TODO: Implement download functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Download functionality coming soon!'),
                  backgroundColor: CustomColor.bgLight1,
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // PDF Viewer
          SfPdfViewer.asset(
            'assets/resume.pdf',
            controller: _pdfViewerController,
            enableDoubleTapZooming: true,
            enableTextSelection: true,
            pageSpacing: 0,
            canShowScrollHead: true,
            canShowScrollStatus: true,
            pageLayoutMode: PdfPageLayoutMode.single,
            scrollDirection: PdfScrollDirection.vertical,
            onZoomLevelChanged: (PdfZoomDetails details) {
              setState(() {
                _currentZoomLevel = details.newZoomLevel;
              });
            },
          ),
          // Zoom level indicator
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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 