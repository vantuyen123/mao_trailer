import 'package:flutter/cupertino.dart';
import 'package:mao_trailer/presentation/themes/app_color.dart';
import 'package:wiredash/wiredash.dart';

class WireDashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WireDashApp({
    Key? key,
    this.navigatorKey,
    required this.child,
    required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      child: child,
      navigatorKey: navigatorKey,
      projectId: 'movie_app-7gaqrqd',
      secret: 'pl0bg89eqr42hl635kty53rwlke48n3tctsxllgxo2bq3zc8',
      options: WiredashOptionsData(
          locale: Locale.fromSubtags(
        languageCode: languageCode,
      )),
      theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColor.royalBlue,
          secondaryColor: AppColor.violet,
          secondaryBackgroundColor: AppColor.vulcan,
          dividerColor: AppColor.vulcan),
    );
  }
}
