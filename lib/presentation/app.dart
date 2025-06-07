import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minimart/core.dart';
import 'package:minimart/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'providers.dart';
import 'router.dart';
import 'themes.dart' show AppThemes;
import 'widgets.dart';

final AppRouter _appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator.get<CartProvider>()),
        ChangeNotifierProvider(
          create: (_) => locator.get<PreferenceProvider>(),
        ),
        ChangeNotifierProvider(create: (_) => locator.get<ProductProvider>()),
        ChangeNotifierProvider(create: (_) => locator.get<UserProvider>()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final (Locale locale, ThemeMode themeMode) = context
              .select<PreferenceProvider, (Locale, ThemeMode)>(
                (p) => (p.locale, p.themeMode),
              );

          return MaterialApp.router(
            title: AppValues.APP_NAME,
            themeAnimationStyle: AppThemes.themeAnimationStyle,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const <LocalizationsDelegate>[
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: locale,
            themeMode: themeMode,
            supportedLocales: S.delegate.supportedLocales,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeAnimationCurve: Curves.easeIn,
            builder: (BuildContext context, Widget? child) {
              return ErrorOverlay(child: FlushbarOverlay(child: child!));
            },
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
