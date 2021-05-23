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
    if(_notifications != null){
      return _notifications.length;
    }
    return -1;
  }

  void addNotifications(List<HolidayNotification> notifications) {
    // for(var notification in notifications){
    //   var contain = notifications.where((element) => element.holiday == notification.holiday &&
    //       element.date == notification.date && element.daysDue == notification.daysDue);
    //   if(contain.isEmpty){
    //     _notifications.add(notification);
    //   }
    // }
    _notifications = notifications;
    while(true){
      var ind = _notifications.indexOf(null);
      if(ind == -1) {
        return;
      }
      _notifications.removeAt(ind);
    }
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