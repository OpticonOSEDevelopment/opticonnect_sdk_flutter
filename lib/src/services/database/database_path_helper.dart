import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as pathprovider;
import 'package:path_provider_windows/path_provider_windows.dart';

@lazySingleton
class DatabasePathHelper {
  Future<String> getDatabasesPath() async {
    Directory directory;
    if (Platform.isIOS || Platform.isMacOS) {
      directory = await pathprovider.getLibraryDirectory();
    } else if (Platform.isAndroid) {
      directory = await pathprovider.getApplicationSupportDirectory();
    } else if (Platform.isWindows) {
      final pathProviderWindows = PathProviderWindows();
      final applicationPath =
          await pathProviderWindows.getApplicationSupportPath();
      if (applicationPath != null) {
        return applicationPath;
      }
      directory = await pathprovider.getApplicationDocumentsDirectory();
    } else {
      throw UnsupportedError('Unsupported platform');
    }
    return directory.path;
  }
}
