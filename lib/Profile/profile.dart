import 'dart:convert';
import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestapp/Controllers/profile_controller.dart';
import 'package:realestapp/Models/sign_in_model.dart';
import '../Auth/sign_in.dart';
import '../Controllers/user_controller.dart';
import '../Models/user_model.dart';
import 'account_details.dart';
import '../Utils/color_scheme.dart';
import 'my_favorites.dart';
import 'my_listings.dart';
import 'account_subscriptions.dart';
import 'settings.dart';

class Profile extends StatefulWidget {
  final SignInModel user;
  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileController _profileController = ProfileController();

  UserController userController = UserController();
  late UserModel user;
  getUser() async {
    var myUser =
        await userController.getUser(widget.user.token_type, widget.user.token);

    setState(() {
      user = UserModel.fromJson(myUser);
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: lightGreen),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              size: 35,
              color: lightGreen,
            )),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Badge(
                  badgeColor: lightGreen,
                  badgeContent: const Icon(
                    Icons.camera_alt,
                    color: white,
                  ),
                  position: const BadgePosition(bottom: 1, end: 1),
                  child: GestureDetector(
                    onTap: () {
                      uploadPicutre();
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: mediumGrey),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(user.picture.toString()),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: const TextStyle(
                    color: darkGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              profileParameters(
                  "My Listings", Icons.list, lightGreen, const MyListings()),
              profileParameters("My Favorites", Icons.favorite, brightRed,
                  const MyFavorites()),
              profileParameters("Account Detials", Icons.person, mediumBlue,
                  const AccountDetails()),
              profileParameters("Upgrade Account", Icons.upgrade, Colors.amber,
                  const AccountSubscription()),
              profileParameters(
                  "Settings", Icons.settings, mediumGrey, const Settings()),
              profileParameters(
                  "Contact Us", Icons.phone, lightGreen, const MyListings()),
              profileParameters("Admin Dashboard", Icons.dashboard, mediumBlue,
                  const MyListings()),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Get.to(const SignIn());
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }

  uploadPicutre() async {
    XFile? picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    var response = await _profileController.changeProfile(
        widget.user.token_type, widget.user.token, File(picture!.path));
    setState(() {
      user = UserModel.fromJson(jsonDecode(response));
    });
  }

  profileParameters(text, icon, color, screen) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 8.0, bottom: 8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(screen);
            },
            child: Row(
              children: [
                Icon(icon, color: color, size: 30),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: const TextStyle(color: darkGrey, fontSize: 17),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.4,
          color: mediumGrey,
        ),
      ],
    );
  }
}
