import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mao_trailer/common/constant/size_constants.dart';
import 'package:mao_trailer/common/extensions/size_extension.dart';

class ThemeText{
  const ThemeText._();

  static TextTheme get _robotoTextTheme => GoogleFonts.robotoTextTheme();
  static TextStyle get _blackHeadline6 => _robotoTextTheme.headline6!.copyWith(
    fontSize: Sizes.dimen_20.sp,
    color: Colors.grey
  );
  static getTextTheme() => TextTheme(
    headline6: _blackHeadline6
  );

}