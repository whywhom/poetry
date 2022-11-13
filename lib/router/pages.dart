import 'package:flutter/material.dart';

import '../main.dart';

class PoetryPage extends Page {
  const PoetryPage({
    required LocalKey key,
    required String name,
  }) : super(
    key: key,
    name: name,
  );

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return MyHomePage(title: 'Route: ${name}');
      },
    );
  }
}