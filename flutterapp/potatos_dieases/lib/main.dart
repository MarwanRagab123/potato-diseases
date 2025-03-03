import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const PotatoDiseaseApp());
}

class PotatoDiseaseApp extends StatefulWidget {
  const PotatoDiseaseApp({super.key});

  @override
  _PotatoDiseaseAppState createState() => _PotatoDiseaseAppState();
}

class _PotatoDiseaseAppState extends State<PotatoDiseaseApp> {
  File? _image;
  String? _label;
  double? _confidence;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _label = null;
        _confidence = null;
      });
      _analyzeImage();
    }
  }

  Future<void> _analyzeImage() async {
    if (_image == null) return;

    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://us-central1-optimum-lodge-444607-n7.cloudfunctions.net/predict'));
    request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var result = json.decode(responseData);
      setState(() {
        _label = result['class'];
        _confidence = result['confidence'];
      });
    } else {
      setState(() {
        _label = 'Error';
        _confidence = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            _image != null
                ? Image.file(_image!, fit: BoxFit.cover)
                : Image.asset('asset/bg.png', fit: BoxFit.cover),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _label != null
                    ? Column(
                        children: [
                          Text(
                            'Label: $_label',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Confidence: ${_confidence?.toStringAsFixed(2)}%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.camera_alt, size: 50, color: Colors.white),
                      onPressed: () => _pickImage(ImageSource.camera),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.image, size: 50, color: Colors.white),
                      onPressed: () => _pickImage(ImageSource.gallery),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
