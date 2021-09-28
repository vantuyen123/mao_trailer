 import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/language_entity.dart';

abstract class LanguageEvent extends Equatable{
  const LanguageEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ToggleLanguageEvent extends LanguageEvent{
  final LanguageEntity language;

  ToggleLanguageEvent(this.language);

  @override
  // TODO: implement props
  List<Object?> get props => [language.code];
}