import 'package:flutter/material.dart';
import 'package:mao_trailer/common/screenutil/screen_util.dart';
import 'package:mao_trailer/presentation/journerys/home/home_screen.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';

class MaoTrailer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height
      ),
      designSize: Size(414, 896)
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Mao Trailer',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(
            elevation: 0
          )
        ),
        home: HomeScreen(),
    );
  }
}