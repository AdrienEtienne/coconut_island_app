import 'package:coconut_island_app/app/blocs/app_version_cubit.dart';
import 'package:coconut_island_app/app/repositories/app_repository.dart';
import 'package:coconut_island_app/ios/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key key,
    @required this.appRepository,
  })  : assert(appRepository != null),
        super(key: key);

  final AppRepository appRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: appRepository,
      child: BlocProvider(
        create: (_) => AppVersionCubit(appRepository),
        child: CupertinoApp(
          title: 'Coconut Island',
          home: HomePage(),
        ),
      ),
    );
  }
}
