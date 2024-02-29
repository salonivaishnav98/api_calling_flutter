import 'dart:convert';
import 'dart:io';
import 'package:api_calling_practice/Models/RegisterApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'loginSc.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeSc(),
    );
  }
}


class HomeSc extends StatefulWidget {

  const HomeSc({super.key});

  @override
  State<HomeSc> createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {

  File? _imageFile;
  final uNameController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final passController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source,imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        // _initializeVideoPlayer();
      });
    }
  }

  Future<RegisterApi> getApiCalling(String uName,String fName,String lName,String email,String pass,File? img) async{

    var request = http.MultipartRequest('POST', Uri.parse("https://fluttersv.pythonanywhere.com/api/register"));
    // Add text fields (such as title and user)
    request.fields['first_name'] = fName;
    request.fields['last_name'] = lName;
    request.fields['username'] = uName;
    request.fields['password'] = pass;
    request.fields['email'] = email;

    // Add image file
    if (img != null) {
      // Open a byte stream from the image file
      var imageStream = http.ByteStream(img.openRead());

      // Get the length of the image file
      var imageLength = await img.length();

      // Create a MultipartFile from the image stream
      var imageMultipartFile = http.MultipartFile(

          'proPic',           // Field name for the file in the request
          imageStream,        // Byte stream of the file
          imageLength,        // Length of the file
          contentType: MediaType("image", "*"),  // Content type of the file
          filename: img.path.split('/').last);
          request.files.add(imageMultipartFile);




      // Filename of the file
    }

    var streamedResponse = await request.send();

    // Get response
    var response = await http.Response.fromStream(streamedResponse);

    // Decode JSON response
    var jsonData = jsonDecode(response.body);
    var data = RegisterApi.fromJson(jsonData);
    return data;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body:   SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: InkWell(
                      onTap: (){
                        dialogBox();
                      },

                      child: _imageFile!=null?CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(_imageFile!),):
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/g_logo.png"),)
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: uNameController,
                  decoration: const InputDecoration(
                      labelText: "username",
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: fNameController,
                  decoration: const InputDecoration(
                      labelText: "first Name",
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: lNameController,
                  decoration: const InputDecoration(
                      labelText: "last name",
                      border: OutlineInputBorder()

                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: "email",
                      border: OutlineInputBorder()

                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: passController,
                  decoration: const InputDecoration(
                      labelText: "password",
                      border: OutlineInputBorder()

                  ),
                ),
                const SizedBox(height: 10,),

                ElevatedButton(onPressed: (){
                  getApiCalling(uNameController.text, fNameController.text, lNameController.text, emailController.text, passController.text,_imageFile)
                      .then((value){
                    if(value.status == 200){
                      Get.snackbar("", "",messageText: Text(value.message!));
                      Get.to(()=>LoginSc());
                    }else{
                      Get.snackbar("", "",messageText: Text(value.message!));
                    }


                  }).onError((error, stackTrace) {
                    Get.snackbar("", "",messageText: const Text("something went wrong"));
                  });

                }, child: const Text("Create user")),

              ],
            ),
          ),
        )

    );
  }

  void dialogBox(){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pick Image"),
          actions: [
            TextButton(onPressed: (){
              _pickImage(ImageSource.gallery);
              Navigator.pop(context);
            }, child: const Text("Select from gallery")),
            TextButton(onPressed: (){
              _pickImage(ImageSource.camera);
              Navigator.pop(context);
            }, child: const Text("take from Camera")),
          ],
        );
      },);
  }

}
