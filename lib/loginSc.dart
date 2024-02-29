import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'allApiCall.dart';
import 'homeSc.dart';

class LoginSc extends StatelessWidget {
   LoginSc({super.key});


  final uNameController =TextEditingController();
  final passController =TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            const Text("Login here"),
            const SizedBox(height: 10,),
            TextField(
              controller: uNameController,
              decoration: const InputDecoration(
                  labelText: "usernamme",
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

              ApiCalling().loginApi(uNameController.text, passController.text).then((value){

                if(value.message!.isEmpty){
                  Get.snackbar("","", messageText: const Text("Invalid Credential"));
                }else{

                  Get.to(()=>HomeSc1(username: value.data!.username,));


                  Get.snackbar("","", messageText: const Text("Login Successfully"));
                }
              }).onError((error, stackTrace) {
                Get.snackbar("","", messageText: const Text("Something went wrong"));
              });
            }, child: const Text("SingIn"))

          ],
        ),
      ),
    );
  }
}


