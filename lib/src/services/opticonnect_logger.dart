import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';

@LazySingleton(as: AppLogger)
class OptiConnectLogger implements AppLogger {
  final Logger _logger = Logger('OpticonnectSDK');

  OptiConnectLogger() {
    Logger.root.level = Level.ALL;
  }

  @override
  void log(String message) {
    _logger.info(message);
  }

  @override
  void warning(String message) {
    _logger.warning(message);
  }

  @override
  void error(String message) {
    _logger.severe(message);
  }

  @override
  void info(String message) {
    _logger.info(message);
  }
}
