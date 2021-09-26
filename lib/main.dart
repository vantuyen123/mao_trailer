import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mao_trailer/presentation/mao_trailer.dart';
import 'package:pedantic/pedantic.dart';

import 'di/get_it.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());

  runApp(MaoTrailer());
}
