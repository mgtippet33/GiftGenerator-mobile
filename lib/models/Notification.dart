import 'package:flutter/cupertino.dart';

/*abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildElement(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  //Widget buildSubtitle(BuildContext context);
}*/

class HolidayNotification{
  final  String daysDue;
  final  String holiday;
  final  DateTime date;
  final  bool isRead;

  HolidayNotification(this.daysDue, this.holiday, this.date, this.isRead);
}