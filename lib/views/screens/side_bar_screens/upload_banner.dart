import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UploadBannerScreen extends StatefulWidget {

  const UploadBannerScreen({super.key});
  static const String routeName = '/upload-banner';


  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  dynamic _image;
  String? _fileName;

  _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;

        //file Name get
        _fileName = result.files.first.name;
      });
    }
  }

  _uploadBannerImage(dynamic image) async {
    Reference ref = _storage.ref().child('Banners').child(_fileName!);

    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  _uploadtoFirestore() async {
    EasyLoading.show(status: 'Uploading Banner...');
    if (_image != null) {
      String imageUrl = await _uploadBannerImage(_image);
      await _firestore.collection('banners').doc(_fileName).set({
        'image': imageUrl,
      }).whenComplete(() => EasyLoading.showSuccess('Banner Uploaded'));
    }

    setState(() {
      _image = null;
    });

      // EasyLoading.dismiss();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Upload Banner',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.yellow.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        // image: const DecorationImage(
                        //   image: AssetImage('assets/images/banner.jpg'),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: _image != null
                          ? Image.memory(
                              _image,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.image,
                              color: Color.fromARGB(255, 235, 232, 218),
                              size: 50,
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.yellow.shade900,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        onPressed: () {
                          _pickImage();
                        },
                        child: const Text('Upload Image'))
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.yellow.shade900,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    _uploadtoFirestore();
                  },
                  child: const Text('Save')),
            ],
          )
        ],
      ),
    );
  }
}
