import 'package:coconut_island_app/app/widgets/app_version.dart';
import 'package:coconut_island_app/ios/widgets/CupertinoPopupSurfaceBottom.dart';
import 'package:coconut_island_app/widgets/card.dart';
import 'package:coconut_island_app/style.dart';
import 'package:flutter/cupertino.dart';

import '../../images.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(lightColor),
      navigationBar: CupertinoNavigationBar(
        border: const Border(),
        backgroundColor: const Color(lightColor),
        middle: const Text(
          'Coconut Island',
        ),
        trailing: GestureDetector(
          child: Icon(CupertinoIcons.info),
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext buildContext) {
                return CupertinoPopupSurfaceBottom(
                  middle: const Text("About"),
                  trailing: const Text("OK"),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: getBorderColor(ColorTheme.None),
                        ),
                        bottom: BorderSide(
                          color: getBorderColor(ColorTheme.None),
                        ),
                      ),
                      color: const Color(whiteColor),
                    ),
                    padding: EdgeInsets.all(paddingMd),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text("Version"), AppVersionWidget()],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      child: ListView(
        padding: EdgeInsets.all(paddingMd),
        shrinkWrap: true,
        children: [
          CardWidget(
            color: ColorTheme.Spring,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Mars',
                    style: TextStyle(fontSize: fontSizeLg),
                  ),
                ),
                Image(
                  height: 100,
                  image: springTreeImage,
                )
              ],
            ),
          ),
          CardWidget(
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Recherche',
                    style: TextStyle(fontSize: fontSizeLg),
                  )),
                  Image(
                    height: 100,
                    image: veggiesImage,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
