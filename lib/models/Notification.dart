import 'dart:convert';

class HolidayNotification{
   String daysDue;
   String holiday;
   DateTime date;
   bool isRead;

  HolidayNotification(this.daysDue, this.holiday, this.date, this.isRead);

   factory HolidayNotification.fromJson(List<dynamic> json) {
     var notificationText;
     switch(json[0]) {
       case 0:
         notificationText = "Сьогодні";
         break;
       case 1:
         notificationText = "Завтра";
         break;
       case 2:
         notificationText = "Через 2 дні";
         break;
       case 3:
         notificationText = "Через 3 дні";
         break;
       case 4:
         notificationText = "Через 4 дні";
         break;
       case 5:
         notificationText = "Через 5 днів";
         break;
     }
     print(json[1][0]['name']);
     return HolidayNotification(
         notificationText,
         convertToUTF8(json[1][0]['name']),
         DateTime.parse(json[1][0]['date']),
         true
     );
   }
}

String convertToUTF8(String source){
  List<int> encoded = Latin1Codec().encode(source);
  String decoded = utf8.decode(encoded);
  return decoded;
}