import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationListItem extends StatelessWidget {

  final String title;
  final Function() onPress;

  const NavigationListItem(
      {Key? key, required this.title, required this.onPress,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Theme
                      .of(context)
                      .primaryColor
                      .withOpacity(.7),
                  blurRadius: 2
              )
            ]
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme
                .of(context)
                .textTheme
                .subtitle1,
          ),
        ),
      ),
    );
  }
}