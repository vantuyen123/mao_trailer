import 'package:mao_trailer/domain/entites/language_entity.dart';

class Languages{
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'es', value: 'Spanish'),
    LanguageEntity(code: 'vi', value: 'VietNam')
  ];
}