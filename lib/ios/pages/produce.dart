import 'package:coconut_island_app/app/blocs/blocs.dart';
import 'package:coconut_island_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return CupertinoPageScaffold(
      backgroundColor: const Color(lightColor),
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            border: const Border(),
            backgroundColor: const Color(lightColor),
            largeTitle: Text(args.name),
          ),
          BlocBuilder<ProduceBloc, ProduceState>(
            builder: (context, state) {
              if (state is ProduceLoadFailure) {
                return SliverFillRemaining(
                  child: Text(
                    'Something went wrong!',
                    style: TextStyle(color: CupertinoColors.destructiveRed),
                  ),
                );
              }
              if (state is ProduceLoadSuccess) {
                final produce = state.produce;

                return SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        padding: EdgeInsets.all(paddingMd),
                        child: Text('Description de mon veggie'),
                      ),
                      Container(
                        padding: EdgeInsets.all(paddingMd),
                        decoration:
                            BoxDecoration(border: Border(top: borderSide)),
                        child: produce.seasonality.isAllYear
                            ? Text('Disponible toute l\'année')
                            : Text(
                                "Disponible de ${produce.seasonality.firstMonthName} à ${produce.seasonality.lastMonthName}"),
                      ),
                      Container(
                        padding: EdgeInsets.all(paddingMd),
                        decoration:
                            BoxDecoration(border: Border(top: borderSide)),
                        child: Text('Préparations'),
                      ),
                    ],
                  ),
                );
              }
              return SliverFillRemaining(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
