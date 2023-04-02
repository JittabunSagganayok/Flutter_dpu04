import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final ImagePicker _picker = ImagePicker();
  //XFile? _photo;
  var _photo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _previewPhoto(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text("Gallery"),
                onPressed: () async {
                  final file =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _photo = file;
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text("Camera"),
                onPressed: () async {
                  final file =
                      await _picker.pickImage(source: ImageSource.camera);
                  setState(() {
                    _photo = file;
                  });
                },
              ),
            ],
          ),
          //Text(""),
        ],
      ),
    );
  }

  Widget _previewPhoto() {
    return _photo == null
        ? const Text("NO PHOTO SELECTED")
        : Image.file(File(_photo!.path));
  }
}
