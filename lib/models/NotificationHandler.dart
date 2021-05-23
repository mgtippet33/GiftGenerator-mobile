import 'Notification.dart';

class NotificationHandler {
  List<HolidayNotification> _notifications;

  static final NotificationHandler instance = NotificationHandler._internal();
  NotificationHandler._internal() {}

  factory NotificationHandler(List<HolidayNotification> notifications) {
    instance._notifications = notifications;
    return instance;
  }

  int length(){
    return _notifications.length;
  }

  List<HolidayNotification> getNotifications() {
    return _notifications;
  }

  void readNotification(int index) {
    if(index < _notifications.length) {
      _notifications[index].isRead = false;
    }
  }
}