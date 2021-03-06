import 'dart:convert';

//import 'package:get/get.dart';

class UserModel {
  late String firstName, lastName, categoryId, email, userName, phone, picture;
  late bool isAdmin;
  late int id;

  UserModel.fromJson(response) {
    var result = json.decode(response);

    var data = result['user'];
    firstName = data['first_name'];
    lastName = data['last_name'];
    id = data['id'];
    email = data['email'];
    userName = data['username'];
    phone = data['phone'];
    picture = data['pp_thumb_url'];
    isAdmin = data['isAdmin'];
  }
}
 