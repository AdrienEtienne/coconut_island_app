import 'package:coconut_island_app/common/card.dart';
import 'package:coconut_island_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                return CupertinoPopupSurface(
                  isSurfacePainted: false,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(lightColor),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(paddingMd),
                              child: const Text("About"),
                            ),
                            CupertinoButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        const Text("What else?")
                      ],
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
                  image: AssetImage("assets/images/spring_tree.png"),
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
                    image: AssetImage("assets/images/veggies.png"),
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
