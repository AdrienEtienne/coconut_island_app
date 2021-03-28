import 'package:bloc/bloc.dart';
import 'package:coconut_island_app/app/data_providers/api_client.dart';
import 'package:coconut_island_app/app/repositories/app_repository.dart';
import 'package:coconut_island_app/app/repositories/produce_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app/observers/observers.dart';
import 'ios/app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final appRepository = AppRepository();
  final produceRepository = ProduceRepository(
    ApiClient(),
  );

  runApp(App(appRepository, produceRepository));
}
