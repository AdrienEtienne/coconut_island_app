import 'package:coconut_island_app/app/blocs/blocs.dart';
import 'package:coconut_island_app/app/blocs/produce_bloc.dart';
import 'package:coconut_island_app/app/repositories/app_repository.dart';
import 'package:coconut_island_app/app/repositories/repositories.dart';
import 'package:coconut_island_app/ios/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App(this.appRepository, this.produceRepository);

  final AppRepository appRepository;
  final ProduceRepository produceRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: CupertinoApp(
        title: 'Coconut Island',
        routes: {
          HomePage.routeName: (context) => HomePage(),
          ProducesPage.routeName: (context) => ProducesPage(),
          ProducePage.routeName: (context) => ProducePage(),
        },
      ),
      providers: [
        BlocProvider(
          create: (context) => AppVersionCubit(appRepository),
        ),
        BlocProvider(
          create: (context) => ProduceBloc(produceRepository),
        ),
      ],
    );
  }
}
