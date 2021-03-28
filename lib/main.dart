import 'package:coconut_island_app/app/repositories/app_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ios/app.dart';

void main() {
  runApp(App(appRepository: AppRepository()));
}
