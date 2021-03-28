import 'package:coconut_island_app/app/blocs/blocs.dart';
import 'package:coconut_island_app/app/data_providers/date_time_provider.dart';
import 'package:coconut_island_app/style.dart';
import 'package:flutter/cupertino.dart';
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
        .add(ProducesRequested(month: args.month));

    return CupertinoPageScaffold(
      backgroundColor: const Color(lightColor),
      navigationBar: CupertinoNavigationBar(
        border: const Border(),
        backgroundColor: const Color(lightColor),
        middle: Text(
          DateTimeProvider.getMonthName(),
        ),
      ),
      child: BlocBuilder<ProduceBloc, ProduceState>(
        builder: (context, state) {
          if (state is ProduceInitial || state is ProducesLoadInProgress) {
            return Center(child: CupertinoActivityIndicator());
          }
          if (state is ProducesLoadSuccess) {
            final produces = state.produces;

            return ListView(
              children: produces
                  .map(
                    (e) => Text(e.name),
                  )
                  .toList(),
            );
          }
          return Text(
            'Something went wrong!',
            style: TextStyle(color: CupertinoColors.destructiveRed),
          );
        },
      ),
    );
  }
}
