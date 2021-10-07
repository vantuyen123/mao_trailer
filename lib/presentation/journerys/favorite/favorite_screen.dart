import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/di/component/get_it.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_state.dart';
import 'package:mao_trailer/presentation/journerys/favorite/favorite_movie_grid_view.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    _favoriteBloc = getItInstance<FavoriteBloc>();
    _favoriteBloc.add(LoadFavoriteMovieEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _favoriteBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.FAVORITEMOVIES.t(context).toString(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(context),
            icon: Icon(
          Icons.arrow_back_ios,
          size: 18.sp,
        )),
      ),
      body: BlocProvider.value(
        value: _favoriteBloc,
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteMovieLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    TranslationConstants.NOFAVORITEMOVIES.t(context).toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }
              return FavoriteMovieGridView(movies: state.movies);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
