import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/language.dart';
import 'package:mao_trailer/common/constant/route_constants.dart';
import 'package:mao_trailer/di/component/get_it.dart';
import 'package:mao_trailer/presentation/app_localizations.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_event.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_state.dart';
import 'package:mao_trailer/presentation/blocs/loading/loading_bloc.dart';
import 'package:mao_trailer/presentation/blocs/login/login_bloc.dart';
import 'package:mao_trailer/presentation/journerys/loading/loading_screen.dart';
import 'package:mao_trailer/presentation/routes.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';
import 'package:mao_trailer/presentation/widgets/wiredsh_app.dart';

import 'blocs/language_bloc/language_bloc.dart';
import 'fade_page_route_builder.dart';

class MaoTrailer extends StatefulWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  _MaoTrailerState createState() => _MaoTrailerState();
}

class _MaoTrailerState extends State<MaoTrailer> {
  late LanguageBloc _languageBloc;
  late LoginBloc _loginBloc;
  late LoadingBloc _loadingBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
    _languageBloc.add(LoadPreferredLanguageEvent());
    _loginBloc = getItInstance<LoginBloc>();
    _loadingBloc = getItInstance<LoadingBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    _loginBloc.close();
    _loadingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider<LanguageBloc>.value(
            value: _languageBloc,
          ),
          BlocProvider<LoginBloc>.value(
            value: _loginBloc,
          ),
          BlocProvider<LoadingBloc>.value(
            value: _loadingBloc,
          )
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoaded) {
              return WireDashApp(
                navigatorKey: widget._navigatorKey,
                languageCode: state.locale.languageCode,
                child: MaterialApp(
                  navigatorKey: widget._navigatorKey,
                  debugShowCheckedModeBanner: false,
                  title: 'Movie App',
                  theme: ThemeData(
                      unselectedWidgetColor: AppColor.royalBlue,
                      primaryColor: AppColor.vulcan,
                      scaffoldBackgroundColor: AppColor.vulcan,
                      colorScheme: ThemeData()
                          .colorScheme
                          .copyWith(secondary: AppColor.royalBlue),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      textTheme: ThemeText.getTextTheme(),
                      appBarTheme: const AppBarTheme(elevation: 0)),
                  // home: HomeScreen(),
                  builder: (context, child) {
                    return LoadingScreen(
                      screen: child!,
                    );
                  },
                  initialRoute: RouteList.initial,
                  onGenerateRoute: (RouteSettings? settings) {
                    final routes = Routes.getRoutes(settings!);
                    final WidgetBuilder? builder = routes[settings.name];
                    return FadePageRouteBuilder(
                        builder: builder!, settings: settings);
                  },
                  supportedLocales:
                      Languages.languages.map((e) => Locale(e.code)).toList(),
                  locale: state.locale,
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
