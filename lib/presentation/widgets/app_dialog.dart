import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';

import 'button.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget image;

  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: 32,
      insetPadding: EdgeInsets.all(32.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      child: Container(
        padding: EdgeInsets.only(top: 4.h, left: 16.w, right: 16.w),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColor.vulcan,
            blurRadius: 16,
          )
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context).toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                description.t(context).toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            image,
            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: TranslationConstants.OKAY,
            )
          ],
        ),
      ),
    );
  }
}
