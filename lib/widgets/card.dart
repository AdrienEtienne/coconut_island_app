import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../style.dart';

class CardWidget extends StatefulWidget {
  final Widget child;
  final ColorTheme color;

  CardWidget({this.child, this.color});

  @override
  _CardWidgetState createState() => _CardWidgetState();

  int getBackgroundColor() {
    switch (this.color) {
      case ColorTheme.Spring:
        return springColor;
      default:
        return whiteColor;
    }
  }
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: marginMd),
      decoration: BoxDecoration(
        border: Border.all(
          color: getBorderColor(this.widget.color),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [boxShadow],
        color: Color(this.widget.getBackgroundColor()),
      ),
      child: Padding(
        child: this.widget.child,
        padding: EdgeInsets.all(paddingMd),
      ),
    );
  }
}
