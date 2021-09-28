import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function() onPress;

  const NavigationSubListItem({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(.7),
              blurRadius: 2)
        ]),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
