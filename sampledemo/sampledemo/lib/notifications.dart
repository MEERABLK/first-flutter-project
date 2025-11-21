import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;

class NotificationsService
{
  static final NotificationsService _notificationsService =
      NotificationsService.internal();

  // use singleton pattern only one instance of NotificationService exists

  factory NotificationsService()
  {
    return _notificationsService;
  }


  // this plugins prepares Android to specif the notification channel
  // it also provides the launcher as the icon
  // it will also launch once he show button is activated
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationsService.internal();

  Future<void>initNotification ()async
  {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings=
        InitializationSettings(android: initializationSettingsAndroid);

    //the setting sare initialized after they are
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }

  //create a notification channel
Future<void>showNotification(int id, String title, String body)async
{
  await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 2)),
      NotificationDetails(
        android: AndroidNotificationDetails("main_channel", "Main Channel",
        channelDescription: 'private', importance: Importance.max),

      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,);
}
}