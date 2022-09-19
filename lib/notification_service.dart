

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService();

  final localNotification = FlutterLocalNotificationsPlugin();

  Future<void> intialize() async {
    AndroidInitializationSettings andriodSetting =
    const AndroidInitializationSettings('@mipmap/ic_launcher');


    InitializationSettings setting = InitializationSettings(
        android: andriodSetting);

    await  localNotification.initialize(setting,onSelectNotification: (value){

    });
  }


  Future<NotificationDetails> notificationDetails() async {
    AndroidNotificationDetails details = const AndroidNotificationDetails(
      'channelId', 'channelName', playSound: true,priority: Priority.high
      ,importance: Importance.high,
      channelDescription: 'Here am i',);

    return NotificationDetails(android: details);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async{
    var  details =await  notificationDetails();
    await  localNotification.show(id, title, body, details);
  }
}
