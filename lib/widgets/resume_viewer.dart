import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeViewer extends StatefulWidget {
  const ResumeViewer({super.key});

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
          // PDF Viewer
          SfPdfViewer.network(
            'https://turquoise-merridie-57.tiiny.site/',
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
            onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
              setState(() {
                _error = 'Failed to load PDF: ${details.error}';
                _isLoading = false;
              });
            },
            onDocumentLoaded: (PdfDocumentLoadedDetails details) {
              setState(() {
                _isLoading = false;
                _error = null;
              });
            },
          ),
          // Loading indicator
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: CustomColor.yellowPrimary,
              ),
            ),
          // Error message
          if (_error != null)
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColor.bgLight1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _error!,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                              _error = null;
                            });
                          },
                          child: const Text('Retry'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: _openInBrowser,
                          child: const Text('Open in Browser'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          // Zoom level indicator
          if (!_isLoading && _error == null)
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
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
