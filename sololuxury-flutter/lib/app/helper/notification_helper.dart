import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

//background Notification
void backgroundNotification() async {
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("handling backgrond message :- ${message.messageId}");
}

//Local Notitcation
void sendMeNotification() async {
  await messaging.subscribeToTopic('sendmeNotication');
  await messaging.unsubscribeFromTopic('sendmeNotication');
}

void notificationPermission() async {
  if (Platform.isIOS) {
    await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
  }
}

void initMessaging() {
  var androidInit = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var iosInit = const DarwinInitializationSettings();
  var initSetting = InitializationSettings(android: androidInit, iOS: iosInit);

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin?.initialize(initSetting);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification notification = message.notification!;
    showNotification(notification);
  });
}

void showNotification(RemoteNotification notification) async {
  var androidDetails = AndroidNotificationDetails(
    channel.id,
    channel.name,
    channelDescription: channel.description,
    importance: Importance.high,
    color: Colors.black,
    playSound: true,
    icon: '@mipmap/ic_launcher',
  );
  var iosDetails = const DarwinNotificationDetails();
  var generalNotificationDetails =
      NotificationDetails(android: androidDetails, iOS: iosDetails);

  await flutterLocalNotificationsPlugin?.show(notification.hashCode,
      notification.title, notification.body, generalNotificationDetails);
}

Future<String?> getFCMToken() async {
  debugPrint("Get FCM Token :- ${await messaging.getToken()}");
  return await messaging.getToken();
}
