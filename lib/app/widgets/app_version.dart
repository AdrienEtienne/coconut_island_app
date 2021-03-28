import 'package:coconut_island_app/app/blocs/app_version_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppVersionWidget extends StatefulWidget {
  @override
  _AppVersionWidgetState createState() => _AppVersionWidgetState();
}

class _AppVersionWidgetState extends State<AppVersionWidget> {
  @override
  Widget build(BuildContext context) {
    context.read<AppVersionCubit>().readAppVersion();

    return BlocBuilder<AppVersionCubit, String>(
      builder: (context, state) {
        return Text(state);
      },
    );
  }
}
