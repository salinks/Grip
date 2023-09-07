

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> handleBackgroundMessage(RemoteMessage? message) async
  {
  print("Title : ${message?.notification?.title?.toString()}");

  }

  Future<void> initNotifications()async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("fcmToke--- ${fcmToken!}");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}