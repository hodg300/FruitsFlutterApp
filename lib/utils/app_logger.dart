import 'package:flutter/foundation.dart';
import 'package:fruitsapp/utils/utils.dart';

class AppLogger {
  static void error(dynamic errorLogMessage,
      {bool withToast = false, bool withStackTrace = true}) {
    if (Utils.isInReleaseMode) return;
    if (errorLogMessage == null) return;

    if (withStackTrace) {
      StackTrace? stackTrace;
      if (errorLogMessage is TypeError) {
        TypeError e = errorLogMessage;
        stackTrace = e.stackTrace;
      } else {
        stackTrace = StackTrace.current;
      }

      // https://flutter.dev/docs/cookbook/maintenance/error-reporting
      //FlutterError.dumpErrorToConsole ??
      if (kDebugMode) {
        print("\x1B[31mError: $errorLogMessage at:\n $stackTrace\x1B[0m");
      }
//    _logger.fine(logMessage);
    } else {
      if (kDebugMode) {
        print("\x1B[31mError: $errorLogMessage\x1B[0m");
      }
    }
  }

  /// Returns the stack trace
  static String log(dynamic logMessage, {withStackTrace = true}) {
    if (!Utils.isInDebugMode) return "";
    String message = logMessage?.toString() ?? "<null>";
    String stackTrace = StackTrace.current.toString();
    if (withStackTrace) {
      String line = stackTrace.split('\n')[1];
      line = line.replaceAll("flutter: #1", "");
      if (kDebugMode) {
        print("\x1B[32m$line: $message\x1B[0m");
      }
    } else {
      if (kDebugMode) {
        print("\x1B[32m$message\x1B[0m");
      }
    }

    return stackTrace;
  }

}