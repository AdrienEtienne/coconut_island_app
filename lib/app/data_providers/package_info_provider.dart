import 'package:package_info/package_info.dart';

class PackageInfoProvider {
  Future<PackageInfo> readData() async {
    var packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
}
