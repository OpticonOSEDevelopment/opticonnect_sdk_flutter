import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';

@LazySingleton(as: AppLogger)
class OptiConnectLogger implements AppLogger {
  final Logger _logger;

  OptiConnectLogger()
      : _logger = Logger(
          printer: PrettyPrinter(),
        );

  @override
  void log(String message) {
    _logger.i(message);
  }

  @override
  void warning(String message) {
    _logger.w(message);
  }

  @override
  void error(String message) {
    _logger.e(message);
  }

  @override
  void info(String message) {
    _logger.i(message);
  }
}
