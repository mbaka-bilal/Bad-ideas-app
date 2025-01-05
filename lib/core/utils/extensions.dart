import 'package:intl/intl.dart';

extension ImageExtension on String {
  get svgImage => "assets/images/svg/$this.svg";

  get svgIcon => "assets/icons/svg/$this.svg";

  get pngImage => "assets/images/png/$this.png";

  get pngIcon => "assets/icons/png/$this.png";

  get isImage => (endsWith(".jpg") || endsWith(".png") || endsWith(".jpeg"));
}

extension StringExtension on String {
  String firstLetterToUpperCase() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension NullableStringExtension on String? {
  String? firstLetterToUpperCase() {
    return this?.firstLetterToUpperCase();
  }
}

extension DateTimeExtension on DateTime {
  String toMonthYear() {
    return DateFormat("MMMM yyyy").format(this);
  }

  String toDay() {
    return DateFormat("dd").format(this);
  }

  String toMonth() {
    return DateFormat("MMM").format(this);
  }

  String toDayMonthYear() {
    return DateFormat("dd MMMM yyyy").format(this);
  }
}
