import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner Demo',
      home: BarcodeScannerPage(),
    );
  }
}

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String _scanResult = '';

  Future<void> _scanBarcode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666",
      "Cancel",
      true,
      ScanMode.BARCODE,
    );

    setState(() {
      _scanResult = barcodeScanResult;
    });
  }

  void _launchUrl(String? url) async {
    if (url != null && await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: false,
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
        },
      );
    } else {
      print('Could not launch $url');
    }
  }

  Widget _buildResultWidget() {
    List<String?> urls = _extractUrls(_scanResult);
    if (urls.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scan Result:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              _scanResult,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Links:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: urls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Text(
                      urls[index]!,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () => launch(urls[index]!),
                    onLongPress: () => _copyToClipboard(urls[index]!),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    } else {
      return Center(
        child: Text(
          'ScanResult: $_scanResult',
          style: TextStyle(fontSize: 16),
        ),
      );
    }
  }

  List<String?> _extractUrls(String text) {
    RegExp urlRegex =
        RegExp(r"(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-&?=%.]+");
    Iterable<RegExpMatch> matches = urlRegex.allMatches(text);
    List<String?> urls = matches.map((match) => match.group(0)).toList();
    return urls;
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied $text to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: _buildResultWidget()),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.qr_code_scanner),
              onPressed: _scanBarcode,
              iconSize: 64,
            ),
          ],
        ),
      ),
    );
  }
}
