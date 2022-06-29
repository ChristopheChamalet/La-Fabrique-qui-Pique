import 'package:flutter_local_notifications/flutter_local_notifications.dart';


void sendNotificationsDaily({String? title , String? body}) async {
  FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  const IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const LinuxInitializationSettings initializationSettingsLinux = LinuxInitializationSettings(defaultActionName: 'hello');
const InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
  iOS: initializationSettingsIOS,
  linux: initializationSettingsLinux,
);
await _notifications.initialize(initializationSettings);


AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'High Channel', 'High Name ',
   description: 'This is a description',
   importance: Importance.max,
   );

_notifications.periodicallyShow(
  0,
 title,
  body,
  RepeatInterval.daily,
   NotificationDetails(
      android: AndroidNotificationDetails(channel.id, channel.name,
      channelDescription: channel.description
),
));
}

void sendNotificationsWeekly({String? title , String? body}) async {
  FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  const IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const LinuxInitializationSettings initializationSettingsLinux = LinuxInitializationSettings(defaultActionName: 'hello');
const InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
  iOS: initializationSettingsIOS,
  linux: initializationSettingsLinux,
);
await _notifications.initialize(initializationSettings);


AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'High Channel', 'High Name',
   description: 'This is a description',
   importance: Importance.max,
   );

_notifications.periodicallyShow(
  0,
 title,
  body,
  RepeatInterval.weekly,
   NotificationDetails(
      android: AndroidNotificationDetails(channel.id, channel.name,
      channelDescription: channel.description
),
));
}


void cancelNotifications()  async {
    FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
    await _notifications.cancelAll();
}


