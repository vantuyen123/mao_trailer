import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/domain/entites/movie_search_params.dart';
import 'package:mao_trailer/domain/usecases/movie/get_search_movies.dart';
import 'package:mao_trailer/presentation/blocs/search_movies_bloc/search_movie_event.dart';
import 'package:mao_trailer/presentation/blocs/search_movies_bloc/search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchMovies searchMovies;

  SearchMovieBloc({required this.searchMovies}) : super(SearchMovieInitial());

  @override
  Stream<SearchMovieState> mapEventToState(SearchMovieEvent event) async* {
    if (event is SearchTermChangedEvent) {
      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();
        final Either<AppError, List<MovieEntity>> response =
            await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));
        yield response.fold(
          (l) => SearchMovieError(l.appErrorType),
          (r) => SearchMovieLoaded(r),
        );
      }
    }
  }
}
