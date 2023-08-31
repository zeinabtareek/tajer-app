import 'package:ansicolor/ansicolor.dart';

import '../../utils/serialization/serialization_lib.dart';
// import 'package:barbecue/barbecue.dart';


enum LogLevel { verbose, debug, emitEvent, info, warning, error, logRequest }

class DebugLogger extends AbsLogger {
  late AnsiPen _verbosePen,
      _debugPen,
      _infoPen,
      _warningPen,
      _errorPen,
      _defaultPen;

  DebugLogger() {
    _verbosePen = AnsiPen()..rgb(r: 126 / 256, g: 78 / 265, b: 68 / 256);
    _debugPen = AnsiPen()..rgb(r: 55 / 256, g: 128 / 265, b: 73 / 256);
    _infoPen = AnsiPen()..rgb(r: 47 / 256, g: 146 / 265, b: 191 / 256);
    _warningPen = AnsiPen()..xterm(214);
    _errorPen = AnsiPen()..red();
    _defaultPen = AnsiPen()..xterm(8);
  }

  void enableAnsiColors() {
    ansiColorDisabled = false;
  }

  AnsiPen _getPen(LogLevel? ll) {
    return ll == LogLevel.verbose
        ? _verbosePen
        : ll == LogLevel.debug
        ? _debugPen
        : ll == LogLevel.info
        ? _infoPen
        : ll == LogLevel.warning
        ? _warningPen
        : ll == LogLevel.error
        ? _errorPen
        : _defaultPen;
  }

  @override
  List<String> getSavedLogs() {
    return [];
  }

  @override
  void clearSavedLogs() {
    // do nothing
  }

  @override
  void writeLogLine(LogLevel? ll, String line) {
    print(_getPen(ll).write(line));
  }
}

abstract class AbsLogger {
  final List<String> _tagFilters = [];

  LogLevel? _logLevel = LogLevel.verbose;

  /// enables table rendering for lists and maps (or Serializables)
  bool enableTableRendering = true;
  bool enableLongLogs = false;
  int longLogLength = 2000;
  int logLength = 900;
  bool splitLog = true;

  //abstract
  void writeLogLine(LogLevel? ll, String line);

  List<String> getSavedLogs();

  void clearSavedLogs();

  ///sets the log level that should be displayed, lower levels won't be shown.
  ///
  ///set to null to stop showing any logs
  void setLogLevel(LogLevel? ll) {
    _logLevel = ll;
    print("__log level set to $ll __");
  }

  ///prevents all kind of logs from appearing in the console
  void disableLogging() {
    setLogLevel(null);
    print("__loging disabled__");
  }

  void verbose(String name, [Object? value = "", String? tag]) {
    writeLog(LogLevel.verbose, name, value, tag);
  }

  void info(
      {required String message,
        Map<String, Object> additionalProperties = const <String, Object>{},
        DateTime? timestamp}) {
    writeLog(LogLevel.info, message, additionalProperties);
  }

  void debug(
      {required String message,
        Map<String, Object> additionalProperties = const <String, Object>{},
        DateTime? timestamp}) {
    writeLog(LogLevel.debug, message, additionalProperties);
  }

  void warning(
      {required String message,
        Map<String, Object> additionalProperties = const <String, Object>{},
        DateTime? timestamp}) {
    writeLog(LogLevel.warning, message, additionalProperties);
  }

  void error(
      {required Object error,
        StackTrace? stackTrace,
        String? problemId,
        Map<String, Object> additionalProperties = const <String, Object>{},
        DateTime? timestamp}) {
    writeLog(LogLevel.error, error.toString(), additionalProperties);
  }

  void emitEvent(
      {required String name,
        Map<String, Object> additionalProperties = const <String, Object>{},
        DateTime? timestamp}) {
    writeLog(LogLevel.emitEvent, name, additionalProperties);
  }

  void logRequest(
      {String? id,
        required Duration duration,
        required String responseCode,
        DateTime? timestamp,
        String? source,
        String? name,
        String? requestMethod,
        bool? success,
        required String? url,
        Map<String, Object> additionalProperties = const <String, Object>{}}) {
    //writeLog(LogLevel.emitEvent, name, value, tag);
  }

  String logLevelName(LogLevel ll) {
    return ll == LogLevel.verbose
        ? 'VERBOSE'
        : ll == LogLevel.debug
        ? 'DEBUG'
        : ll == LogLevel.info
        ? 'INFO'
        : ll == LogLevel.warning
        ? 'WARNING'
        : ll == LogLevel.error
        ? 'ERROR'
        : '';
  }

  // CellStyle get _cellStyle =>
  //     const CellStyle(borderLeft: false, paddingRight: 1);
  //
  // String renderList(List list) {
  //   if (enableTableRendering) {
  //     return '\r\n${Table(tableStyle: const TableStyle(border: true), header: TableSection(cellStyle: _cellStyle, rows: [
  //       Row(cells: [const Cell('Length'), Cell(list.length.toString())])
  //     ]), body: TableSection(cellStyle: _cellStyle, rows: list.asMap().entries.map((m) => Row(cells: [
  //       Cell(m.key.toString()),
  //       Cell(renderItemString(m.value.toString()))
  //     ])).toList())).render()}';
  //   } else {
  //     String l = "";
  //     l += "length: ${list.length} , items: [ ";
  //     for (var item in list) {
  //       l += "$item , ";
  //     }
  //     l += " ]";
  //     return l;
  //   }
  // }

  // String renderMap(Map map) {
  //   if (enableTableRendering) {
  //     return '\r\n${Table(tableStyle: const TableStyle(border: true), body: TableSection(cellStyle: _cellStyle, rows: map.entries.map((m) => Row(cells: [
  //       Cell(m.key.toString()),
  //       Cell(renderItemString(m.value.toString()))
  //     ])).toList())).render()}';
  //   } else {
  //     return map.toString();
  //   }
  // }

  String renderItemString(dynamic item) {
    var s = item.toString();
    if (!enableLongLogs && s.length > longLogLength) {
      return '<Tooo Long, Enable long logs to see>';
    }
    return s;
  }

  ///add a tag to tag filters so that only logs with these tags will show
  void addTagFilter(String tag) {
    _tagFilters.add(tag);
    print("__logs are now filtered by tags (${_tagFilters.join("-")})__");
  }

  void clearFilterTags() {
    _tagFilters.clear();
    print("__logging tag filters cleared__");
  }

  /// does the requird processing before writeLogLine() writes it
  void writeLog(LogLevel ll, String name, [Object? value = "", String? tag]) {
    if (_logLevel == null) return;

    if (ll.index >= _logLevel!.index &&
        (_tagFilters.isEmpty || _tagFilters.contains(tag))) {
      String valueString = "";
      //
      if (value != null) {
        if (value is Serializable) {
          // valueString = renderMap(value.toMap());
        } else if (value is Map) {
          // valueString = renderMap(value);
        } else if (value is List) {
          // valueString = renderList(value);
        } else {
          valueString = value.toString();
        }
      }
      //
      if (!enableTableRendering) {
        valueString = valueString.replaceAll(RegExp(r"(\r|\n)"), " ");
      }

      var logString = "${tag != null ? '($tag): ' : ''}$name => $valueString";

      if (splitLog) {
        int length = logString.length;
        if (!enableLongLogs && length > longLogLength) {
          length = longLogLength;
        }
        //
        int startIndex = 0;

        while (length > logLength) {
          writeLogLine(ll,
              '${logLevelName(ll)} ${logString.substring(startIndex, startIndex + logLength)}');
          startIndex += logLength;
          length -= logLength;
        }
        writeLogLine(ll,
            '${logLevelName(ll)} ${logString.substring(startIndex, startIndex + length)}');
        //
        writeLogLine(null, "-----------------");
      } else {
        // the entire log is single unit
        if (!enableLongLogs && logString.length > longLogLength) {
          writeLogLine(ll,
              '${logLevelName(ll)} ${logString.substring(0, longLogLength)}');
        } else {
          writeLogLine(ll, '${logLevelName(ll)} $logString');
        }
      }
    }
  }
}
