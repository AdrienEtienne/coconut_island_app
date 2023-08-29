import 'package:coconut_island_app/app/blocs/blocs.dart';
import 'package:coconut_island_app/app/data_providers/date_time_provider.dart';
import 'package:coconut_island_app/extensions/extensions.dart';
import 'package:coconut_island_app/ios/pages/produce.dart';
import 'package:coconut_island_app/style.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProducesPageArguments {
  final int month;

  ProducesPageArguments(this.month);
}

class ProducesPage extends StatelessWidget {
  static const routeName = '/produces';

  @override
  Widget build(BuildContext context) {
    final ProducesPageArguments args =
        ModalRoute.of(context).settings.arguments;
    BlocProvider.of<ProduceBloc>(context)
        .add(ProducesRequested(month: args?.month));

    final title = args?.month == null
        ? 'Fruits et Légumes'
        : DateTimeProvider.getMonthName();

    return CupertinoPageScaffold(
      backgroundColor: const Color(lightColor),
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            border: const Border(),
            backgroundColor: const Color(lightColor),
            largeTitle: Text(title),
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
              if (state is ProducesLoadSuccess) {
                final produces = state.produces;

                final widgets = <Widget>[];

                final groups = produces
                    .groupBy((produce) => removeDiacritics(produce.name)[0]);

                final border = Border(bottom: borderSide);

                groups.forEach((key, elements) {
                  widgets.add(
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingMd,
                        vertical: paddingSm,
                      ),
                      decoration: BoxDecoration(
                        border: border,
                      ),
                      child: Text(key),
                    ),
                  );

                  elements.forEach((element) {
                    widgets.add(
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                                context, ProducePage.routeName,
                                arguments: ProducePageArguments(
                                    element.id, element.name))
                            .then((value) {
                          BlocProvider.of<ProduceBloc>(context)
                              .add(ProducesRequested(month: args?.month));
                        }),
                        child: Container(
                          padding: EdgeInsets.all(paddingMd),
                          decoration: BoxDecoration(
                              color: Color(whiteColor), border: border),
                          child: Text(element.name),
                        ),
                      ),
                    );
                  });
                });

                return SliverList(
                  delegate: SliverChildListDelegate(widgets),
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
