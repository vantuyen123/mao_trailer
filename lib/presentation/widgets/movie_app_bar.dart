import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mao_trailer/presentation/blocs/search_movies_bloc/search_movie_bloc.dart';
import 'package:mao_trailer/presentation/journerys/search_movie/custom_search_movie_delegate.dart';

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
              height: 35.h,
            ),
          ),
          Expanded(
            child: Logo(
              height: 35.h,
            ),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  BlocProvider.of<SearchMovieBloc>(context)
                ),
               );
            },
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
