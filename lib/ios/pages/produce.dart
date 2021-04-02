import 'package:coconut_island_app/app/blocs/blocs.dart';
import 'package:coconut_island_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../images.dart';

class ProducePageArguments {
  final int id;
  final String name;

  ProducePageArguments(this.id, this.name);
}

class ProducePage extends StatelessWidget {
  static const routeName = '/produce';

  @override
  Widget build(BuildContext context) {
    final ProducePageArguments args = ModalRoute.of(context).settings.arguments;
    BlocProvider.of<ProduceBloc>(context).add(ProduceRequested(args.id));

    return BlocBuilder<ProduceBloc, ProduceState>(
      builder: (context, state) {
        var slivers = [];

        if (state is ProduceLoadFailure) {
          slivers.add(
            SliverFillRemaining(
              child: Text(
                'Something went wrong!',
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ),
            ),
          );
        } else if (state is ProduceLoadSuccess) {
          final produce = state.produce;

          slivers.add(
            SliverToBoxAdapter(
              child: Container(
                color: Color(whiteColor),
                padding: EdgeInsets.all(paddingMd),
                child: Text('Description de mon veggie.'),
              ),
            ),
          );

          final season = produce.seasonality.isAllYear
              ? 'Disponible toute l\'année'
              : "Disponible de ${produce.seasonality.firstMonthName} à ${produce.seasonality.lastMonthName}";
          slivers.add(
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.centerRight,
                color: Color(whiteColor),
                padding: EdgeInsets.all(paddingMd),
                margin: EdgeInsets.only(bottom: marginMd),
                child: Text(season, style: TextStyle(fontSize: fontSizeSm)),
              ),
            ),
          );

          final recettes = [
            'Papillotes de poulet à l\'italienne au pesto',
            'Saucisses fumées sauce au vin rouge et aux baies de genièvre',
            'Tarte soleil épinards et féta'
          ];
          slivers.addAll([
            SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.all(paddingMd),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Suggestions de Recettes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Voir plus',
                        style: TextStyle(fontSize: fontSizeSm),
                      ),
                    ],
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                margin: EdgeInsets.only(bottom: marginMd),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recettes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(paddingMd),
                      margin: EdgeInsets.symmetric(horizontal: marginMd),
                      decoration: new BoxDecoration(
                        color: const Color(darkColor),
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: recipeImage,
                        ),
                      ),
                      child: Text(
                        recettes[index],
                        style: TextStyle(
                            color: Color(whiteColor),
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ),
            ),
          ]);

          final preparations = ['A l\'eau', 'A l\'huile', 'A la crème'];
          slivers.add(
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.all(paddingMd),
                    child: const Text(
                      'Préparations',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...preparations.map(
                    (e) => Container(
                      padding: EdgeInsets.all(paddingMd),
                      decoration: BoxDecoration(
                        border: Border(bottom: borderSide),
                        color: Color(whiteColor),
                      ),
                      child: Text(e),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          slivers.add(
            SliverFillRemaining(
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
          );
        }

        return CupertinoPageScaffold(
          backgroundColor: const Color(lightColor),
          child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                border: const Border(),
                backgroundColor: const Color(lightColor),
                largeTitle: Text(args.name),
              ),
              ...slivers.toList(),
            ],
          ),
        );
      },
    );
  }
}
