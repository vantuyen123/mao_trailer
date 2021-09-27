import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 4.h,
          left: 16.w,
          right: 16.w),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height:35.h,
            ),
          ),
          Expanded(
            child: Logo(
              height: 35.h,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30.sp,
            ),
          )
        ],
      ),
    );
  }
}
