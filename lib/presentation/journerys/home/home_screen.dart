import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mao_trailer/di/get_it.dart';
import 'package:mao_trailer/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_carousel_bloc/movie_carousel_event.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.6,
            child: Placeholder(
              color: Colors.grey,
            ),
          ),
          FractionallySizedBox(
            heightFactor: 0.4,
            alignment: Alignment.topCenter,
            child: Placeholder(color: Colors.white,),
          )
        ],
      ),
    );
  }
}
