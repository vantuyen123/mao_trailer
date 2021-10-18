import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/presentation/blocs/login/login_bloc.dart';
import 'package:mao_trailer/presentation/widgets/logo.dart';

class SocialAuthentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 15.w,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              BlocProvider.of<LoginBloc>(context).add(LoginGoogleEvent());
            },
            child: Logo(
              height: 75.h,
              image: 'assets/images/logo/Google_Logo.png',
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Logo(
              height: 75.h,
              image: 'assets/images/logo/Facebook_Logo.png',
            ),
          ),
        ],
      ),
    );
  }
}
