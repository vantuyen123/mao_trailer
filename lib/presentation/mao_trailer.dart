import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/presentation/journerys/home/home_screen.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';

class MaoTrailer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
            primaryColor: AppColor.vulcan,
            scaffoldBackgroundColor: AppColor.vulcan,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: ThemeText.getTextTheme(),
            appBarTheme: const AppBarTheme(elevation: 0)),
        home: HomeScreen(),
      ),
    );
  }
}
