import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isEnabled;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      height: 45.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isEnabled
              ? [AppColor.royalBlue, AppColor.violet]
              : [Colors.grey, Colors.grey],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text.t(context).toString(),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
