import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Controllers/sign_in_controller.dart';

class ProfileController extends GetxController {
  SignInController signInController = Get.put(SignInController());
  changeProfile(token_type,token,image) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://lagosabuja.com/wp-json/rtcl/v1/my/profile-image'));
    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['X-API-KEY'] = '835c5442-20ca-4d51-9e32-fae11c35fd42';
    request.headers['Authorization'] =
        '$token_type $token';
    request.files.add(http.MultipartFile.fromBytes(
        'image', File(image!.path).readAsBytesSync(),
        filename: image!.path));
    var res = await request.send();
  }
}
