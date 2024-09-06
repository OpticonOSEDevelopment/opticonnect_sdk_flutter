import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as pathprovider;

@lazySingleton
class DatabasePathHelper {
  Future<String> getDatabasesPath() async {
    Directory directory;
    if (Platform.isIOS || Platform.isMacOS) {
      directory = await pathprovider.getLibraryDirectory();
    } else if (Platform.isAndroid) {
      directory = await pathprovider.getApplicationSupportDirectory();
    } else {
      throw UnsupportedError('Unsupported platform');
    }
    return directory.path;
  }
}
