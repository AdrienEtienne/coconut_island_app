import 'package:coconut_island_app/app/blocs/app_version_cubit.dart';
import 'package:coconut_island_app/app/data_providers/date_time_provider.dart';
import 'package:coconut_island_app/app/repositories/app_repository.dart';
import 'package:coconut_island_app/app/widgets/app_version.dart';
import 'package:coconut_island_app/ios/widgets/CupertinoPopupSurfaceBottom.dart';
import 'package:coconut_island_app/widgets/card.dart';
import 'package:coconut_island_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../images.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.appRepository,
  })  : assert(appRepository != null),
        super(key: key);

  final AppRepository appRepository;

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
                    child: BlocProvider(
                      create: (_) => AppVersionCubit(appRepository),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Text("Version"), AppVersionWidget()],
                      ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateTimeProvider.getMonthName(),
                        style: TextStyle(fontSize: fontSizeLg),
                      ),
                      Text(
                        "Légumes et Fruits du mois",
                        style: TextStyle(fontSize: fontSizeSm),
                      ),
                    ],
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
                    child: Center(
                      child: Text(
                        'Recherche',
                        style: TextStyle(fontSize: fontSizeLg),
                      ),
                    ),
                  ),
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
