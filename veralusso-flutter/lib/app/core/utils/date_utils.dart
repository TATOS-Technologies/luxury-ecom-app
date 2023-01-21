import 'package:intl/intl.dart';

class DateParseUtils {
  ///
  /// Format `DateTime` to `String`
  ///
  static String? dateTimeToJsonUTC(DateTime? dateTime) {
    return dateTime?.toUtc().toIso8601String();
  }

  ///
  /// Format `String` to `DateTime`
  ///
  static DateTime? dateTimeFromJsonUTC(String? dateTimeStr) {
    if (dateTimeStr == null) return null;
    DateTime? dateTime;
    try {
      dateTime = DateTime.parse(dateTimeStr).toLocal();
    } catch (e) {
      try {
        dateTime =
            // ignore: unnecessary_string_escapes
            DateFormat('yyyy-MM-dd\THH:mm:ss.Z')
                .parseUTC(dateTimeStr)
                .toLocal();
      } catch (e) {
        try {
          // ignore: unnecessary_string_escapes
          dateTime = DateFormat('yyyy-MM-dd\THH:mm:ssZ')
              .parseUTC(dateTimeStr)
              .toLocal();
        } catch (e) {
          try {
            dateTime = DateFormat('yyyy-MM-dd HH:mm:ss')
                .parseUTC(dateTimeStr)
                .toLocal();
          } catch (e) {
            try {
              dateTime = DateFormat('dd/MM/yyyy HH:mm:ss')
                  .parseUTC(dateTimeStr)
                  .toLocal();
            } catch (e) {
              try {
                dateTime =
                    DateFormat('yyyy-MM-dd').parseUTC(dateTimeStr).toLocal();
              } catch (e) {
                //
              }
            }
          }
          //
        }
      }
    }
    return dateTime;
  }
}
