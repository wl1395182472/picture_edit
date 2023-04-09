import 'package:logger/logger.dart';

final sLog = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printEmojis: false,
    printTime: true,
  ),
  level: Level.debug,
);

void getMaterialLogWriterCallback(
  String text, {
  bool isError = false,
}) {
  isError ? sLog.e('GETX $text') : sLog.v('GETX $text');
}
