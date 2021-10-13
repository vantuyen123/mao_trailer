import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';

class LabelFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;
  final UnderlineInputBorder _enableBorder = const UnderlineInputBorder(
      borderSide: BorderSide(
    color: Colors.grey,
  ));

  final UnderlineInputBorder _focusedBorder =
      const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));

  const LabelFieldWidget({
    Key? key,
    required this.label,
    required this.hintText,
    this.isPasswordField = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start,
          ),
          TextField(
            obscureText: isPasswordField,
            obscuringCharacter: '*',
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.greySubTitle1,
              focusedBorder: _focusedBorder,
              enabledBorder: _enableBorder,
            ),
          )
        ],
      ),
    );
  }
}
