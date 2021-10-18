import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  final double height;
  final String image;

  const Logo({
    Key? key,
    required this.height,
    required this.image,
  })  : assert(height > 0, 'Height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height.h,
    );
  }
}
