import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!
      .copyWith(fontSize: 20.sp, color: Colors.white);

  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1!
      .copyWith(fontSize: 20.sp, color: Colors.white);

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
      color: Colors.white,
      fontSize: 20.sp,
      wordSpacing: 0.25,
      letterSpacing: 0.25,
      height: 1.5);

  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
        subtitle1: whiteSubtitle1,
        bodyText1: whiteBodyText2,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle => subtitle1!
      .copyWith(color: AppColor.royalBlue,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600);
}
