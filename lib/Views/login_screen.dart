import 'package:config_app/Services/user_service.dart';
import 'package:config_app/ViewModels/login_viewmodel.dart';
import 'package:config_app/Views/url_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Constant/colors.dart';
import '../Constant/theme.dart';

class LoginScreen extends StatefulWidget {
  static String routename = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisiable = false;

  @override
  Widget build(BuildContext context) {
    LoginViewModel _vm = LoginViewModel();
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
              child: Image.asset(
                'assets/images/logo.png',
                scale: 0.8,
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.10, vertical: size.height * 0.02),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: _vm.emailHint,
                  hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
                      .copyWith(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: mainColor,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  )),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
            child: TextFormField(
              controller: passwordController,
              obscureText: isVisiable == false ? true : false,
              decoration: InputDecoration(
                  hintText: _vm.passwordHint,
                  hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
                      .copyWith(color: Colors.grey),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisiable = !isVisiable;
                        });
                      },
                      icon: isVisiable == false
                          ? Icon(
                              _vm.unVisiableIcon,
                              size: 20,
                              color: Colors.grey[400],
                            )
                          : Icon(
                              _vm.visiableIcon,
                              size: 20,
                              color: Colors.grey,
                            )),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: mainColor,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    side: const BorderSide(color: mainColor)),
                onPressed: () async {
                  var user = await UserApi().fetchUser();

                  if (emailController.text == user.email &&
                      passwordController.text == user.password) {
                    Navigator.pushNamed(context, UrlScreen.routename);
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Check your data!!',
                        textColor: whiteColor,
                        backgroundColor: Colors.red);
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                  ),
                )),
          )
        ],
      ),
    )));
  }
}
