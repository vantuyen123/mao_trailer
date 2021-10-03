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

  static TextStyle get _whiteBodyText1 => _poppinsTextTheme.bodyText1!.copyWith(
      color: Colors.white,
      fontSize: 20.sp,
      wordSpacing: 0.25,
      letterSpacing: 0.25,
      height: 1.5);

  static TextStyle get _whiteButton =>
      _poppinsTextTheme.button!.copyWith(fontSize: 18.sp, color: Colors.white);

  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headline5!.copyWith(
        fontSize: 24.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
      color: Colors.white,
      fontSize: 18.sp,
      wordSpacing: 0.25,
      letterSpacing: 0.25,
      height: 1.5);

  static getTextTheme() => TextTheme(
        headline5: _whiteHeadline5,
        headline6: _whiteHeadline6,
        subtitle1: whiteSubtitle1,
        bodyText1: _whiteBodyText1,
        bodyText2: _whiteBodyText2,
        button: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle => subtitle1!.copyWith(
      color: AppColor.royalBlue, fontSize: 20.sp, fontWeight: FontWeight.w600);

  TextStyle get greySubTitle1 => subtitle1!.copyWith(
      color: Colors.grey, fontSize: 20.sp, fontWeight: FontWeight.w600);

  TextStyle get violetHeadline6 => headline6!.copyWith(
      color: AppColor.violet, fontSize: 20.sp, fontWeight: FontWeight.w600);

  TextStyle get vulcanBodyText2 =>
      bodyText2!.copyWith(color: AppColor.vulcan, fontWeight: FontWeight.w600);

  TextStyle get greyCaption => caption!.copyWith(
    color: Colors.grey
  );
}
