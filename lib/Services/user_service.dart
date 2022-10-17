import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Constant/cach_helper.dart';
import '../Constant/constant.dart';
import '../Models/user_model.dart';

class UserApi {
  Future<User> fetchUser() async {
    User user = User();
    var res = await FirebaseFirestore.instance
        .collection('user')
        .doc('ejL2uANAqyBHdBnmH7Fo')
        .get();

    user = User.fromJson(res.data()!);

    return user;
  }
}
