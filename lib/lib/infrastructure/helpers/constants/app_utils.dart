import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Helpers.
import '../extensions/datetime_extension.dart';
import 'app_styles.dart';



/// A utility class that holds commonly used functions
/// This class has no constructor and all variables are `static`.
@immutable
class AppUtils {
  const AppUtils._();

  /// A random value generator.
  static Random randomizer([int? seed]) => Random(seed);

  /// A utility method to map an integer to a color code
  /// Useful for color coding class erps.
  // static Color getRandomColor([int? seed, List<Color>? colors]) {
  //   final rInt = seed != null ? (seed + DateTime
  //       .now()
  //       .minute) : null;
  //   final _colors = colors ?? AppColors.primaries;
  //   return _colors[randomizer(rInt).nextInt(_colors.length)];
  // }

  /// A utility method to convert 0/1 to false/true.
  static bool boolFromInt(int i) => i == 1;

  /// A utility method to convert true/false to 1/0.
  // ignore: avoid_positional_boolean_parameters.
  static int boolToInt(bool b) => b ? 1 : 0;

  /// A utility method to convert DateTime to API
  /// accepted date JSON format.
  static String dateToJson(DateTime date) {
    return date.toDateString('yyyy-MM-dd');
  }

  /// A utility method to convert DateTime to API
  /// accepted datetime JSON format.
  static String dateTimeToJson(DateTime date) {
    return date.toDateString('yyyy-MM-dd HH:mm:ss');
  }

  /// A utility method to convert JSON 24hr time string
  /// to a [TimeOfDay] object.
  static TimeOfDay timeFromJson(String time) {
    final dateTime = DateFormat.Hms().parse(time);

    return TimeOfDay.fromDateTime(dateTime);
  }

  /// A utility method to convert any instance to null.
  static T? toNull<T>(Object? _) => null;

  /// A utility method to remove nulls from int list.
  static List<int>? removeNulls(List? list) {
    return list?.whereType<int>().toList();
  }

  /// Helper method to show toast message.
  static void showFlushBar({
    required BuildContext context,
    required String message,
    IconData? icon = Icons.error_rounded,
    double? iconSize = 28,
    Color? iconColor = Colors.redAccent,
  }) {
    Flushbar<void>(message: message, messageSize: 15, messageColor: Colors.white, icon: Icon(icon, size: iconSize, color: iconColor), shouldIconPulse: false, margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), padding: const EdgeInsets.fromLTRB(20, 15, 20, 15), borderRadius: Corners.rounded9, backgroundColor: const Color.fromARGB(218, 48, 48, 48), boxShadows: Shadows.universal, duration: const Duration(seconds: 3), dismissDirection: FlushbarDismissDirection.HORIZONTAL).show(context);
  }
}
/// A utility class that holds commonly used regular expressions
/// employed throughout the entire app.
/// This class has no constructor and all variables are `static`.
@immutable
class Regexes {
  /// The regular expression for validating emails in the app.
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );

  /// The regular expression for validating contacts in the app.
  static RegExp contactRegex = RegExp(r'^(03|3)\d{9}$');

  /// The regular expression for validating erps in the app.
  static RegExp erpRegex = RegExp(r'^[1-9]{1}\d{4}$');

  /// The regular expression for validating names in the app.
  static RegExp nameRegex = RegExp(r'^[a-z A-Z]+$');

  /// The regular expression for validating zip codes in the app.
  static RegExp zipCodeRegex = RegExp(r'^\d{5}$');

  /// The regular expression for validating credit card numbers in the app.
  static RegExp creditCardNumberRegex =
  RegExp(r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$');

  /// The regular expression for validating credit card CVV in the app.
  static RegExp creditCardCVVRegex = RegExp(r'^[0-9]{3}$');

  /// The regular expression for validating credit card expiry in the app.
  static RegExp creditCardExpiryRegex =
  RegExp(r'(0[1-9]|10|11|12)/20[0-9]{2}$');

  /// The regular expression for validating credit card expiry in the app.
  static final RegExp otpDigitRegex = RegExp(r'^[0-9]{1}$');
  const Regexes._();
}

/// A utility class that holds all the timings used throughout
/// the entire app by things such as animations, tickers etc.
///
/// This class has no constructor and all variables are `static`.
@immutable
class Durations {
  static const fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const normal = Duration(milliseconds: 300);
  static const medium = Duration(milliseconds: 500);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
  const Durations._();
}
