import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/route_constants.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/presentation/blocs/login/login_bloc.dart';
import 'package:mao_trailer/presentation/journerys/login/label_fiel_widget.dart';
import 'package:mao_trailer/presentation/widgets/button.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _userController, _passwordController;
  bool enableSignIn = true;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _passwordController = TextEditingController();

    textEditingListen();
  }

  void textEditingListen() {
    _userController.addListener(() {
      setState(() {
        enableSignIn = _userController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        enableSignIn = _userController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // _userController.clear();
    // _passwordController.clear();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                TranslationConstants.loginToMovieApp.t(context).toString(),
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline5,
              ),
            ),
            LabelFieldWidget(
              label: TranslationConstants.username.t(context).toString(),
              hintText:
              TranslationConstants.enterTMDbUsername.t(context).toString(),
              controller: _userController,
            ),
            LabelFieldWidget(
              label: TranslationConstants.password.t(context).toString(),
              hintText:
              TranslationConstants.enterPassword.t(context).toString(),
              controller: _passwordController,
              isPasswordField: true,
            ),
            BlocConsumer<LoginBloc,LoginState>(
              builder: (context, state) {
                if (state is LoginError) {
                  return Text(
                    state.message.t(context).toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .orangeSubtitle1,
                  );
                }
                return SizedBox(height: 25.h);
              },
              buildWhen: (previous, current) => current is LoginError,
              listenWhen: (previous, current) => current is LoginSuccess,
              listener: (context, state) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteList.home, (route) => false,);
              },
            ),
            Button(
              onPressed: enableSignIn
                  ? () {
                BlocProvider.of<LoginBloc>(context).add(
                  LoginInitiateEvent(
                    _userController.text,
                    _passwordController.text,
                  ),
                );
              } : () {},
              text: TranslationConstants.signIn,
              isEnabled: enableSignIn,
            )
          ],
        ),
      ),
    );
  }
}
