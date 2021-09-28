import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/language.dart';
import 'package:mao_trailer/di/get_it.dart';
import 'package:mao_trailer/presentation/app_localizations.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_state.dart';
import 'package:mao_trailer/presentation/journerys/home/home_screen.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';

import 'blocs/language_bloc/language_bloc.dart';

class MaoTrailer extends StatefulWidget {
  @override
  _MaoTrailerState createState() => _MaoTrailerState();
}

class _MaoTrailerState extends State<MaoTrailer> {
  late LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => BlocProvider<LanguageBloc>.value(
        value: _languageBloc,
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoaded) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  unselectedWidgetColor: AppColor.royalBlue,
                    primaryColor: AppColor.vulcan,
                    scaffoldBackgroundColor: AppColor.vulcan,
                    accentColor: AppColor.royalBlue,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    textTheme: ThemeText.getTextTheme(),
                    appBarTheme: const AppBarTheme(elevation: 0)),
                home: HomeScreen(),
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
