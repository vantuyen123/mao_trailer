import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: 80.h,
      padding: EdgeInsets.only(top: 2.h, bottom: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1.r)),
        gradient: LinearGradient(
          colors: [AppColor.violet, AppColor.royalBlue],
        ),
      ),
    );
  }
}
