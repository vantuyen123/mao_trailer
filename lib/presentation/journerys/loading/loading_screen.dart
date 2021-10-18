import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/presentation/blocs/loading/loading_bloc.dart';
import 'package:mao_trailer/presentation/journerys/loading/loading_circle.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        return Stack(
          children: [
            screen,
            if (state is LoadingStarted)
              Container(
                decoration: BoxDecoration(
                  color: AppColor.vulcan.withOpacity(0.6),
                ),
                child: Center(
                  child: LoadingCircle(
                    size: 200.w,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
