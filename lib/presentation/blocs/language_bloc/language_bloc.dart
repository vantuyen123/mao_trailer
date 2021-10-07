import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/common/constant/language.dart';
import 'package:mao_trailer/domain/entites/no_params.dart';
import 'package:mao_trailer/domain/usecases/language/get_preferred_language.dart';
import 'package:mao_trailer/domain/usecases/language/update_language.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_event.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBloc({
    required this.getPreferredLanguage,
    required this.updateLanguage,
  }) : super(
          LanguageLoaded(
            Locale(Languages.languages[0].code),
          ),
        );

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is ToggleLanguageEvent) {
      await updateLanguage(event.language.code);
      add(LoadPreferredLanguageEvent());
    } else if (event is LoadPreferredLanguageEvent) {
      final response = await getPreferredLanguage(NoParams());
      yield response.fold(
        (l) => LanguageError(),
        (r) => LanguageLoaded(Locale(r)),
      );
    }
  }
}
