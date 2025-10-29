import 'package:field_visit_app/app/core/utils/theme/theme_app.dart';
import 'package:field_visit_app/app/presentation/global/controllers/router/router_gc.dart';
import 'package:field_visit_app/app/domain/repositories/snackbar/widgets/loader/loader_gw.dart';
import 'package:field_visit_app/app/presentation/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerController = routerGP.read();

    routerController.load(routerProvider.read());

    return Stack(
      alignment: Alignment.center,
      children: [
        MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routerProvider.read(),
          theme: ThemeApp.lightTheme,
          darkTheme: ThemeApp.darkTheme,
          themeMode: ThemeMode.system,
          localizationsDelegates: _getLocalizationsDelegate(),
          title: 'Field Visit App',
        ),
        const LoaderGW(),
      ],
    );
  }

  Iterable<LocalizationsDelegate<dynamic>>? _getLocalizationsDelegate() {
    return [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ];
  }
}
