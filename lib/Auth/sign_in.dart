import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:realestapp/Auth/sign_up.dart';
import 'package:realestapp/Controllers/sign_in_controller.dart';
import '../Home/home.dart';
import '../Models/user_model.dart';
import '../Utils/color_scheme.dart';
import 'package:get/get.dart';
import '../Utils/constants.dart';
import 'sign_in_phone.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserModel user;
  final SignInController _signInController = SignInController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: transparent,
      //   elevation: 0.0,
      //   leading: GestureDetector(
      //       onTap: () {
      //         Get.back();
      //       },
      //       child: const Icon(
      //         Icons.navigate_before,
      //         size: 35,
      //         color: lightGreen,
      //       )),
      // ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      color: lightGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  textField('E-mail address', false, emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  textField('Password', false, passwordController),
                  const SizedBox(
                    height: 35,
                  ),
                  defaultButton(
                    'Log In',
                    () async {
                      user = UserModel.fromJson(await _signInController.signIn(
                          emailController.text, passwordController.text));
                      Get.to(Home(
                        user: user,
                      ));
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(child: Text('OR')),
                  const SizedBox(
                    height: 15,
                  ),
                  socialButton('Facebook Login',
                      const FaIcon(FontAwesomeIcons.facebook), darkBlue),
                  const SizedBox(
                    height: 15,
                  ),
                  socialButton('Google Login',
                      const FaIcon(FontAwesomeIcons.google), brightRed),
                  const SizedBox(
                    height: 15,
                  ),
                  socialButton('LinkedIn Login',
                      const FaIcon(FontAwesomeIcons.linkedin), mediumBlue),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account? "),
                      InkWell(
                        onTap: () {
                          Get.to(const SignUp());
                        },
                        child: const Center(
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              color: brightRed,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
