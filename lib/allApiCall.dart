import 'dart:convert';

import 'package:api_calling_practice/Models/LoginApi.dart';
import 'package:http/http.dart' as http;
class ApiCalling{

  Future<LoginApi> loginApi(String username,String password)async{
    final response= await http.post(Uri.parse("https://fluttersv.pythonanywhere.com/api/login"),
    body: {
      "username":username,
      "password":password
    }
    );

    final jsonData = jsonDecode(response.body);
    final data =LoginApi.fromJson(jsonData);

    return data;

  }

}