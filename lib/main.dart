import 'package:config_app/Constant/cach_helper.dart';
import 'package:config_app/Constant/constant.dart';
import 'package:config_app/Views/login_screen.dart';
import 'package:config_app/Views/url_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CachHelper.init();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey:
              'https://configapp-f21ef-default-rtdb.europe-west1.firebasedatabase.app',
          appId: '1:777455219547:android:a60add3258cc0948c8207e',
          messagingSenderId: '777455219547',
          projectId: 'configapp-f21ef'));
  var res = await FirebaseFirestore.instance
      .collection('config')
      .doc('X7ijlmwtQK574lcxZ1Qy')
      .get();

  CachHelper.saveData(key: 'baseurl', value: res['baseURL']);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.routename,
      routes: {
        LoginScreen.routename: (_) => const LoginScreen(),
        UrlScreen.routename: (_) => const UrlScreen()
      },
    );
  }
}
