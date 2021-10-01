import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/data/core/api_constants.dart';
import 'package:mao_trailer/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:mao_trailer/presentation/blocs/cast_bloc/cast_state.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';

class CastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(builder: (context, state) {
      if (state is CastStateLoaded) {
        return Container(
          height: 290.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.casts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final castEntity = state.casts[index];
              return Container(
                height: 285.h,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: 160.w,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.r),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${ApiConstants.BASE_IMAGE_URL}${castEntity.posterPath}',
                            height: 285.h,
                            width: 160.w,
                            errorWidget: (context,url,error) => Image.asset('assets/jpg/avatar.jpg',fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          castEntity.name,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.vulcanBodyText2,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
                        child: Text(
                          castEntity.character,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
