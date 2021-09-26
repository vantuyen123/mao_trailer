import 'package:equatable/equatable.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieTabbedChangedEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  MovieTabbedChangedEvent({this.currentTabIndex = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [currentTabIndex];
}
