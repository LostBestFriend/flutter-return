import 'package:app_test/core/app_routes.dart';
import 'package:app_test/src/presentation/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        color: Colors.blue,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.route,
        routes: appRoutes,
        onUnknownRoute: onUnknownRoute,
      ),
    ),
  );
}
