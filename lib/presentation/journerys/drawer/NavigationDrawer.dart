import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            NavigationListItem(title: 'Favorite Movies', onPress: (){}),
            NavigationExpandedListItem(title: 'Language', onPressed: (){}, children: [
              'English',
              'Viet Nam'
            ]),
            NavigationListItem(title: 'Feedback', onPress: (){}),
            NavigationListItem(title: 'About', onPress: (){}),
          ],
        ),
      ),
    );
  }
}
