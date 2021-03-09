import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Coconut Island'),
      ),
      child: Center(child: Icon(CupertinoIcons.share)),
    );
  }
}
