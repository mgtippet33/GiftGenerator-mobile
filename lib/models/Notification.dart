import 'package:flutter/cupertino.dart';
class HolidayNotification{
  final  String daysDue;
  final  String holiday;
  final  DateTime date;
  final  bool isRead;

  HolidayNotification(this.daysDue, this.holiday, this.date, this.isRead);
}