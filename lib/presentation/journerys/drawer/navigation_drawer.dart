import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/language.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_event.dart';
import 'package:mao_trailer/presentation/journerys/drawer/navigation_expanded_list_title.dart';
import 'package:mao_trailer/presentation/journerys/drawer/navigation_list_item.dart';
import 'package:mao_trailer/presentation/widgets/logo.dart';

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
            NavigationListItem(title: TranslationConstants.FAVORITEMOVIES.t(context).toString(), onPress: () {}),
            NavigationExpandedListItem(
              title: TranslationConstants.LANGUAGE.t(context).toString(),
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {
                print('print index $index');
                BlocProvider.of<LanguageBloc>(context).add(ToggleLanguageEvent(Languages.languages[index]));
              },
            ),
            NavigationListItem(title: TranslationConstants.FEEDBACK.t(context).toString(), onPress: () {}),
            NavigationListItem(title: TranslationConstants.ABOUT.t(context).toString(), onPress: () {}),
          ],
        ),
      ),
    );
  }
}
