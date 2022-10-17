import 'package:config_app/Constant/cach_helper.dart';
import 'package:config_app/Constant/constant.dart';
import 'package:config_app/Services/config_service.dart';
import 'package:config_app/ViewModels/url_screen_viewmodel.dart';
import 'package:config_app/Views/Widgets/custom_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Constant/colors.dart';
import '../Constant/theme.dart';

class UrlScreen extends StatefulWidget {
  static String routename = 'UrlScreen';
  const UrlScreen({super.key});

  @override
  State<UrlScreen> createState() => _UrlScreenState();
}

class _UrlScreenState extends State<UrlScreen> {
  final idController = TextEditingController(text: 'X7ijlmwtQK574lcxZ1Qy');
  final typeController = TextEditingController(text: 'BaseURL');
  final urlController = TextEditingController(text: URL().baseUrl);
  UrlScreenViewModel _vm = UrlScreenViewModel();
  var enable = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _vm.urlController.text = _vm.urlController.text;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(children: [
        Container(
            padding: EdgeInsets.only(top: size.height * 0.1),
            child: Image.asset(
              'assets/images/logo.png',
              scale: 0.8,
            )),
        Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01, horizontal: size.width * 0.01),
            child: customBox(
                size: size,
                maintext: 'ID',
                hintText: 'enter id',
                controller: idController,
                oldData: 'X7ijlmwtQK574lcxZ1Qy',
                enable: false)),
        Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01, horizontal: size.width * 0.01),
            child: customBox(
                size: size,
                maintext: 'Type',
                hintText: 'enter type',
                controller: typeController,
                oldData: 'BaseURL',
                enable: false)),
        Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01, horizontal: size.width * 0.01),
            child: customBox(
                size: size,
                maintext: 'URL',
                hintText: 'url',
                controller: urlController,
                oldData: URL().baseUrl,
                enable: enable)),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.05),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.12,
                      vertical: size.height * 0.01),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  side: const BorderSide(color: mainColor)),
              onPressed: () async {
                if (enable) {
                  await configApi().setData(Url: urlController.text);
                }
                setState(() {
                  enable = !enable;
                });
              },
              child: enable == true
                  ? Text('Update',
                      style: TextStyle(fontSize: size.width * 0.04))
                  : Text(
                      'Enable',
                      style: TextStyle(fontSize: size.width * 0.04),
                    )),
        )
      ]),
    )));
  }
}
