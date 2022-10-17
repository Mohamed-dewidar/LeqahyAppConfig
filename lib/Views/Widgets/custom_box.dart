import 'package:config_app/Views/Widgets/custom_text.dart';
import 'package:config_app/Views/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../Constant/colors.dart';

customBox(
    {required dynamic size,
    required String maintext,
    required String hintText,
    required TextEditingController controller,
    Widget? suffixIcon,
    bool? readOnly,
    Color? hintColor,
    bool? enable,
    required String oldData}) {
  //controller.text = oldData;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05,
              top: size.height * 0.02,
              bottom: size.height * 0.01),
          child: CustomText(
              text: maintext,
              color: Colors.grey[600],
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold)),
      Container(
          margin: EdgeInsets.only(left: size.width * 0.08),
          width: size.width * 0.8,
          height: size.height * 0.05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer,
                    color: darkBlueColor),
              ]),
          child: CustomTextFeild(
              size: size,
              controller: controller,
              enable: enable ?? true,
              hintText: hintText,
              hintColor: hintColor,
              suffixIcon: suffixIcon,
              readOnly: readOnly ?? false))
    ],
  );
}
