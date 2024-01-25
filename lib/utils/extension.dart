import 'dart:developer' as darttools show log;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:intl/intl.dart';

import '/constant/constant_key.dart';

extension Context on BuildContext {
//this extention is for localization
//its a shorter version of AppLocalizations
  AppLocalizations get loc => AppLocalizations.of(this)!;

  //get media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  //get height
  double get height => MediaQuery.of(this).size.height;

  //get width
  double get width => MediaQuery.of(this).size.width;

  //Bottom Notch Check
  bool get bottomNotch =>
      MediaQuery.of(this).viewPadding.bottom > 0 ? true : false;
}

extension NumGenericExtensions<T extends String> on T {
  double parseToDouble() {
    try {
      return double.parse(this);
    } catch (e) {
      e.log;

      return 0.0;
    }
  }

  String parseToString() {
    try {
      return toString();
    } catch (e) {
      e.log();

      return "";
    }
  }
}

extension WidgetExtention on Widget {
  Widget centerCircularProgress({Color? progressColor}) => Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: progressColor,
        ),
      );
}

extension Log on Object {
  void log() => darttools.log(toString());
}

// It will formate the date which will show in our application.
extension FormatedDateExtention on DateTime {
  String formattedDateFromDate(String format) =>
      DateFormat(format).format(this);
}

extension FormatedDateExtentionString on String {
  String formattedDate(String format) {
    DateTime parsedDate = DateTime.parse(this);
    return DateFormat(format).format(parsedDate);
  }
}

extension FormattedYearMonthDate on String? {
  DateTime fomateDateFromString({String? dateFormat}) {
    return DateFormat(dateFormat ?? AppConstant.YYYY_MM.key).parse(this ?? "");
  }
}
