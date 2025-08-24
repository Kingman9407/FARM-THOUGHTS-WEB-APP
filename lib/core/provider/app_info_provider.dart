import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoProvider with ChangeNotifier {
  String? _version;

  String? get version => _version;

  Future<void> loadAppInfo() async {
    final info = await PackageInfo.fromPlatform();
    _version = info.version;
    notifyListeners();
  }
}
