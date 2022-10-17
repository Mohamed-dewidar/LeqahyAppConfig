import 'package:flutter/material.dart';

import '../../Constant/theme.dart';

class LoginViewModel {
  bool isVisiable = false;
  String logoText = 'Leqahy';
  String appBarTitle = 'Login';
  String emailHint = 'Email';
  String passwordHint = 'Password';
  IconData visiableIcon = Icons.visibility;
  IconData unVisiableIcon = Icons.visibility_off;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}
