import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/presentation/widgets/logo.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(25.0),
                child: Logo(
                  height: 120.h,
                ),
              ),
              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
