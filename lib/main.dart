import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:mao_trailer/data/tables/movie_table.dart';
import 'package:mao_trailer/presentation/mao_trailer.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pedantic/pedantic.dart';

import 'di/component/get_it.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  );
  unawaited(getIt.init());
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  runApp(MaoTrailer());
}
