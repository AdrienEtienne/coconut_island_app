import 'package:coconut_island_app/style.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPopupSurfaceBottom extends StatefulWidget {
  final Widget middle;
  final Widget trailing;
  final Widget child;

  CupertinoPopupSurfaceBottom(
      {@required this.middle, @required this.trailing, @required this.child});

  @override
  _CupertinoPopupSurfaceBottomState createState() =>
      _CupertinoPopupSurfaceBottomState();
}

class _CupertinoPopupSurfaceBottomState
    extends State<CupertinoPopupSurfaceBottom> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      isSurfacePainted: false,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(lightColor),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: marginMd),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(paddingMd),
                    child: this.widget.middle,
                  ),
                  CupertinoButton(
                    child: this.widget.trailing,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            this.widget.child,
          ],
        ),
      ),
    );
  }
}
