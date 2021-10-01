import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/cast_entity.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object?> get props => [];
}

class CastStateInitial extends CastState {}

class CastStateLoaded extends CastState{
  final List<CastEntity> casts;

  CastStateLoaded({required this.casts});

  @override
  List<Object?> get props => [casts];
}

class CastStateError extends CastState{}
