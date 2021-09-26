import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_backdrop_bloc/movie_backdrop_event.dart';
import 'package:mao_trailer/presentation/blocs/movie_backdrop_bloc/movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent,MovieBackdropState>{
  MovieBackdropBloc(): super(MovieBackdropInitial());

  @override
  Stream<MovieBackdropState> mapEventToState(MovieBackdropEvent event) async* {
    yield MovieBackdropChanged((event as MovieBackdropChangedEvent).movie);
  }

}