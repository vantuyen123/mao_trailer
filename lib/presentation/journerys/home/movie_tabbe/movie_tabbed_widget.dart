import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_tabbed/movie_tabbed_event.dart';
import 'package:mao_trailer/presentation/blocs/movie_tabbed/movie_tabbed_state.dart';
import 'package:mao_trailer/presentation/journerys/home/movie_tabbe/movie_list_view_builder.dart';
import 'package:mao_trailer/presentation/journerys/home/movie_tabbe/movie_tabbed_constants.dart';
import 'package:mao_trailer/presentation/journerys/home/movie_tabbe/tab_title_widget.dart';
import 'package:mao_trailer/presentation/journerys/loading/loading_circle.dart';
import 'package:mao_trailer/presentation/widgets/app_error_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc
        .add(MovieTabbedChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                for (var i = 0; i < MovieTabbedConstant.movieTabs.length; i++)
                  TabTitleWidget(
                    title: MovieTabbedConstant.movieTabs[i].title,
                    onTap: () => _onTabTapped(i),
                    isSelected: MovieTabbedConstant.movieTabs[i].index ==
                        state.currentTabIndex,
                  ),
              ],
            ),
            if (state is MovieTabChanged)
              state.movies?.isEmpty ?? true
                  ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Center(
                          child: Text(
                            TranslationConstants.NOMOVIES.t(context).toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: MovieListViewBuilder(
                        movies: state.movies!,
                      ),
                    ),
            if (state is MovieTabLoadError)
              Expanded(
                child: AppErrorWidget(
                  errorType: state.errorType,
                  onPressed: () => movieTabbedBloc.add(
                    MovieTabbedChangedEvent(
                      currentTabIndex: state.currentTabIndex,
                    ),
                  ),
                ),
              ),
            if (state is MovieTabLoading)
              Expanded(
                child: Center(
                  child: LoadingCircle(
                    size: 100.w,
                  ),
                ),
              ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabbedChangedEvent(currentTabIndex: index));
  }
}
