import 'package:coconut_island_app/ios/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Coconut Island',
      home: HomePage(),
    );
  }
}
