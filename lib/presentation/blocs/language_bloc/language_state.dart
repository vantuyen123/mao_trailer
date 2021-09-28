import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class LanguageState extends Equatable{
  const LanguageState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LanguageLoaded extends LanguageState{
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  // TODO: implement props
  List<Object?> get props => [locale.languageCode];
}