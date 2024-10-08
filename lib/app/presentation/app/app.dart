// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pomotracker/app/presentation/app/app.vm.dart';
import 'package:pomotracker/app/router/app_router.dart';
import 'package:pomotracker/app/router/app_router.routes.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:pomotracker/core/logger.dart';
import 'package:pomotracker/core/res/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BaseState<AppViewModel, MyApp> {
  @override
  Widget build(BuildContext context) {
    Log.i("Locale : ${viewModel.platformLocale}");
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'PomoTracker',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.theme(),
        navigatorKey: viewModel.mainNavigatorKey,
        initialRoute: RouteMaps.root,
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (_) => const SizedBox()),
        locale: Locale(viewModel.platformLocale),
        onGenerateRoute: onGenerateRoute,
        builder: (context, child) {
          return child!;
        },
      ),
    );
  }
}
