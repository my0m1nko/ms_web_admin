import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ms_multi_web_admin/views/screens/side_bar_screens/widgets/category_widget.dart';

class CategoryScreen extends StatefulWidget {
  // const CategoryScreen({super.key});
  static const String routeName = '/category';

  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  dynamic _image;
  String? _fileName;
  late String _categoryName;

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
  _uploadCategory() async{
    if(_formKey.currentState!.validate()){
      EasyLoading.show(status: 'Uploading Category...');
      if (_image != null) {
        await _uploadCategoryImage(_image).then((imageUrl) {
           _firestore.collection('categories').doc(_fileName).set({
            'image': imageUrl,
            'categoryName': _categoryName,
          }).whenComplete(() => EasyLoading.showSuccess('Category Uploaded'));
        });
        setState(() {
          _image = null;
          _formKey.currentState!.reset();
        });
      }
      else{

        EasyLoading.showError('Please select an image');
        }
      
      EasyLoading.dismiss();
    }
  }

  _uploadCategoryImage(dynamic image) async {
    Reference ref = _storage.ref().child('categoryImages').child(_fileName!);

    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Category Management',
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
               const  SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: SizedBox(
                    width: 180,
                    child: TextFormField(
                      onChanged: (value){
                       
                        _categoryName = value;
                      },
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Please enter category name';
                        }else{
                          return null;}
                      },
                      decoration: const InputDecoration(
                        labelText: 'Category Name',
                        border: OutlineInputBorder(
                          // borderSide: BorderSide.none
                        ),
                        
                      ),
                    ),
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
                      _uploadCategory();
                    },
                    child: const Text('Save')),
              ],
            ),

           const Padding(
             padding:  EdgeInsets.all(8.0),
             child:   Divider(
                color: Colors.grey,
              ),
           ),
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.topLeft,
            child: const Text(
              'Category List',
              style:  TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const CategoryWidget()

          ],
        ),

      ),
    );
  }
}