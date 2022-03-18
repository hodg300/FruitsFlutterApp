import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Utils {
  static bool? _isInDebugMode;

  static bool get isInReleaseMode => !isInDebugMode;

  static bool get isInDebugMode {
    if (_isInDebugMode == null) {
      _isInDebugMode = false;
      // From: https://stackoverflow.com/questions/49707028/check-if-running-app-is-in-debug-mode
      assert(_isInDebugMode = true); // Because assert runs only in debug mode.
    }

    return _isInDebugMode!;
  }


  /// return width size of device in double
  static double screenWidthSize(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// return height size of device in double
  static double screenHeightSize(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static TextStyle setTextStyle({required Color color, required double fontSize, FontWeight fontWeight = FontWeight.normal}) {
    return GoogleFonts.poppins(color: color, fontSize: fontSize, fontWeight: fontWeight);
  }

  static String currency(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString(), name: "ILS");
    return format.currencySymbol;

  }
}