import 'package:logging/logging.dart';

class AppLogger {
  static final AppLogger _singleton = AppLogger._internal();
  late Logger _logger;

  factory AppLogger() {
    return _singleton;
  }

  AppLogger._internal() {
    _logger = Logger('AppLogger');
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  void info(String message) {
    _logger.info(message);
  }

  void warning(String message) {
    _logger.warning(message);
  }

  void error(String message) {
    _logger.severe(message);
  }
}
