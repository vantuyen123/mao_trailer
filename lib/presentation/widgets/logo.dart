import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Logo extends StatelessWidget{
  final double height;

  const Logo({Key? key, required this.height})
      : assert(height >0, 'Height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo/logo.png',
    color: Colors.white,
    height: height.h,);
  }
}