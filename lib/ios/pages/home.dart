import 'package:coconut_island_app/app/data_providers/data_providers.dart';
import 'package:coconut_island_app/app/widgets/app_version.dart';
import 'package:coconut_island_app/ios/pages/produces.dart';
import 'package:coconut_island_app/ios/widgets/CupertinoPopupSurfaceBottom.dart';
import 'package:coconut_island_app/style.dart';
import 'package:flutter/cupertino.dart';
import '../../images.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

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
                        top: borderSide,
                        bottom: borderSide,
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProducesPage.routeName,
                  arguments:
                      ProducesPageArguments(DateTimeProvider.getMonth()));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: marginMd),
              padding: EdgeInsets.all(paddingMd),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [boxShadow],
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(spring1Color),
                    Color(spring2Color),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateTimeProvider.getMonthName(),
                        style: TextStyle(
                          fontSize: fontSizeLg,
                          color: Color(whiteColor),
                        ),
                      ),
                      Text(
                        "Légumes et Fruits du mois",
                        style: TextStyle(
                          fontSize: fontSizeSm,
                          color: Color(whiteColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, ProducesPage.routeName),
            child: Container(
              margin: const EdgeInsets.only(bottom: marginMd),
              padding: const EdgeInsets.symmetric(
                horizontal: paddingMd,
                vertical: paddingSm,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [boxShadow],
                color: Color(whiteColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recherche',
                        style: TextStyle(fontSize: fontSizeLg),
                      ),
                      Text(
                        'Parmis tous les fruits et légumes',
                        style: TextStyle(fontSize: fontSizeSm),
                      ),
                    ],
                  ),
                  Image(
                    height: 80,
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
