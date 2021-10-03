import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/presentation/blocs/search_movies_bloc/search_movie_bloc.dart';
import 'package:mao_trailer/presentation/blocs/search_movies_bloc/search_movie_event.dart';
import 'package:mao_trailer/presentation/blocs/search_movies_bloc/search_movie_state.dart';
import 'package:mao_trailer/presentation/journerys/search_movie/search_movie_card.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';
import 'package:mao_trailer/presentation/widgets/app_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: Theme.of(context).textTheme.greySubTitle1,
            contentPadding: EdgeInsets.only(bottom: 0.h)));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: query.isEmpty
            ? null
            : () {
                query = '';
              },
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25.h,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(SearchTermChangedEvent(query));
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: searchMovieBloc,
      builder: (context, state) {
        if (state is SearchMovieError) {
          return AppErrorWidget(
            errorType: state.errorType,
            onPressed: () => searchMovieBloc.add(
              SearchTermChangedEvent(query),
            ),
          );
        } else if (state is SearchMovieLoaded) {
          if (state.movies.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 64.w),
                child: Text(
                  TranslationConstants.NOMOVIESSEARCHED.t(context).toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.movies.length,
            itemBuilder: (context, index) =>
                SearchMovieCard(movie: state.movies[index]),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
