import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/language.dart';
import 'package:mao_trailer/common/constant/route_constants.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_event.dart';
import 'package:mao_trailer/presentation/blocs/login/login_bloc.dart';
import 'package:mao_trailer/presentation/journerys/drawer/navigation_expanded_list_title.dart';
import 'package:mao_trailer/presentation/journerys/drawer/navigation_list_item.dart';
import 'package:mao_trailer/presentation/widgets/app_dialog.dart';
import 'package:mao_trailer/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(.7),
          blurRadius: 4,
        )
      ]),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 18.h,
                left: 8.w,
                right: 8.w,
              ),
              child: Logo(
                height: 60.h,
              ),
            ),
            NavigationListItem(
                title:
                    TranslationConstants.FAVORITEMOVIES.t(context).toString(),
                onPress: () {
                  Navigator.of(context).pushNamed(RouteList.favorite);
                }),
            NavigationExpandedListItem(
              title: TranslationConstants.LANGUAGE.t(context).toString(),
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {
                BlocProvider.of<LanguageBloc>(context)
                    .add(ToggleLanguageEvent(Languages.languages[index]));
              },
            ),
            NavigationListItem(
              title: TranslationConstants.FEEDBACK.t(context).toString(),
              onPress: () {
                Navigator.of(context).pop();
                Wiredash.of(context)?.show();
              },
            ),
            NavigationListItem(
                title: TranslationConstants.ABOUT.t(context).toString(),
                onPress: () {
                  Navigator.of(context).pop();
                  _showDialog(context);
                }),
            BlocListener<LoginBloc,LoginState>(
              listenWhen: (previous,current) => current is LogoutSuccess,
              listener: (context, state) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteList.initial, (route) => false);
              },
              child: NavigationListItem(
                title: TranslationConstants.logout.t(context).toString(),
                onPress: () {
                  Navigator.of(context).pop();
                  _showDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AppDialog(
          title: TranslationConstants.ABOUT,
          description: TranslationConstants.ABOUTDESCRIPTION,
          buttonText: TranslationConstants.OKAY,
          image: Image.asset(
            'assets/pngs/tmdb_logo.png',
            height: 60.h,
          ),
        );
      },
    );
  }
}
