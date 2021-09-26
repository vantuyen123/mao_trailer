import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: 1.h,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
