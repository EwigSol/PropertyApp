
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/color_scheme.dart';
import 'account_details.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isNotificationSwitched = true;
  bool isAppNotificationSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              color: lightGreen,
              size: 34,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Settings',
                style: TextStyle(
                  color: lightGreen,
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.person,
                    size: 30,
                    color: darkGrey,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: darkGrey,
                thickness: 0.3,
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const AccountDetails());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: mediumGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      size: 35,
                      color: mediumGrey,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Change Password',
                    style: TextStyle(
                      color: mediumGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    size: 35,
                    color: mediumGrey,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.notification_add,
                    size: 30,
                    color: darkGrey,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: darkGrey,
                thickness: 0.3,
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const AccountDetails());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notification',
                      style: TextStyle(
                        color: mediumGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: isNotificationSwitched,
                      onChanged: (value) {
                        setState(() {
                          isNotificationSwitched = value;
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: lightGreen,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'App Notification',
                    style: TextStyle(
                      color: mediumGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Switch(
                    value: isAppNotificationSwitched,
                    onChanged: (value) {
                      setState(() {
                        isAppNotificationSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: lightGreen,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.more,
                    size: 30,
                    color: darkGrey,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: darkGrey,
                thickness: 0.3,
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const AccountDetails());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Country',
                      style: TextStyle(
                        color: mediumGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      size: 35,
                      color: mediumGrey,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Language',
                    style: TextStyle(
                      color: mediumGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    size: 35,
                    color: mediumGrey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
