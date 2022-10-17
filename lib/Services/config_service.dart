import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Constant/cach_helper.dart';
import '../Constant/constant.dart';

class configApi {
  Future<void> setData({String? Url}) async {
    await FirebaseFirestore.instance
        .collection('config')
        .doc('X7ijlmwtQK574lcxZ1Qy')
        .set({'baseURL': Url});
    CachHelper.saveData(key: 'baseurl', value: Url);
  }
}
