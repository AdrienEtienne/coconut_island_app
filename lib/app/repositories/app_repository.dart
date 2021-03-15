import 'dart:async';

import 'package:coconut_island_app/app/data_providers/package_info_provider.dart';
import 'package:package_info/package_info.dart';

class AppRepository {
  final PackageInfoProvider packageInfoProvider = PackageInfoProvider();
  PackageInfo packageInfo;

  AppRepository();

  Future<String> readAppVersion() async {
    if (packageInfo == null) {
      packageInfo = await packageInfoProvider.readData();
    }
    return packageInfo.version + '-b.' + packageInfo.buildNumber;
  }
}
