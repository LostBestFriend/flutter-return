import 'package:app_test/src/presentation/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../src/presentation/ui/home/home_page.dart';
import '../src/presentation/ui/not_found/not_found_page.dart';

var appRoutes = {
  SplashPage.route: (context) => const SplashPage(),
  HomePage.route: (context) => const HomePage(),
};

var onUnknownRoute = (context) {
  return MaterialPageRoute(
    builder: (context) {
      return const NotFoundPage();
    },
  );
};
