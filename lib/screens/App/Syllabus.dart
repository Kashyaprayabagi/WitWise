import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  List<String> pdfUrls = [];

  @override
  void initState() {
    super.initState();
    getPdfUrls();
  }

  Future<void> getPdfUrls() async {
    final FirebaseStorage storage = FirebaseStorage.instance;

    try {
      final ListResult result = await storage.ref('syllabus').listAll();
      final urls = await Future.wait(result.items.map((item) => item.getDownloadURL()));

      setState(() {
        pdfUrls = urls;
      });
    } catch (e) {
      print('Error fetching PDF URLs: $e');
    }
  }

  String decodeUrl(String url) {
    return Uri.decodeComponent(url.split('/').last);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  child: Image.asset('images/open.png'),
                ),
              ),
              const Text(
                'WitWise',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: pdfUrls.isNotEmpty
                    ? ListView.builder(
                  itemCount: pdfUrls.length,
                  itemBuilder: (context, index) {
                    final pdfUrl = pdfUrls[index];
                    var pdfName = decodeUrl(pdfUrl.split('/').last);
                    pdfName = pdfName.replaceFirst('syllabus/', '  ');
                    if (pdfName.endsWith('.pdf')) {
                      pdfName = pdfName.substring(0, pdfName.length - 4); // Remove ".pdf"
                    }

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfViewerScreen(
                              pdfUrl: pdfUrl,
                              pdfName: pdfName,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/pdf.png",
                              height: 80,
                              width: 60,
                            ),
                            Expanded(
                              child: Text(
                                pdfName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
                    : Center(
                  child: Text("No PDFs available."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PdfViewerScreen extends StatelessWidget {
  final String pdfUrl;
  final String pdfName;

  PdfViewerScreen({required this.pdfUrl, required this.pdfName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
      ),
      body: FutureBuilder<PDFDocument>(
        future: PDFDocument.fromURL(pdfUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PDFViewer(document: snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading PDF: ${snapshot.error}'),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
