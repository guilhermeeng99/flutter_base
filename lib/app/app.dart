import 'package:flutter/material.dart';
import 'package:flutter_base/app/routes/app_router.dart';
import 'package:flutter_base/app/theme/app_theme.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: Builder(
        builder: (context) => MaterialApp.router(
          title: 'FlutterBase',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          routerConfig: appRouter,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
        ),
      ),
    );
  }
}
