import 'package:app_test/src/presentation/ui/home/widgets/body_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Twitter', style: TextStyle(color: Colors.blue)),
      ),
      body: const HomeBody(),
    );
  }
}
