import 'package:app_test/src/presentation/ui/home/home_page.dart';
import 'package:app_test/src/presentation/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      color: Colors.blue,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: "Main Page",
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home-page': (context) => const HomePage(),
      },
    ),
  ));
}
