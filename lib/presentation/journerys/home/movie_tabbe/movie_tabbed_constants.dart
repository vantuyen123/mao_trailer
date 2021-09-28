import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/presentation/journerys/home/movie_tabbe/tab.dart';

class MovieTabbedConstant{
  static const List<Tab> movieTabs = const [
    const Tab(index: 0, title: TranslationConstants.POPULAR),
    const Tab(index: 1, title: TranslationConstants.NOW),
    const Tab(index: 2, title: TranslationConstants.SOON),

  ];
}