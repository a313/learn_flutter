import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../repo_abs/noti_repo_abs.dart';

class FcmUsecase {
  final NotiRepo _;
  FcmUsecase(this._);

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  void init() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(onGetInitialMessage);

    /// Đang trong app
    FirebaseMessaging.onMessage.listen(onMessage);

    /// App đang ẩn dươi backgroup xong được mở lên
    FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);
  }

  /// Lần đầu mở app
  void onMessage(RemoteMessage event) {
    showLocalNotificaiotn(event);
    //Add logic for notificaion
  }

  void onMessageOpenedApp(RemoteMessage event) {}

  FutureOr onGetInitialMessage(RemoteMessage? value) {}

  void showLocalNotificaiotn(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'no.consio',
            'no.consio',
            icon: 'launch_background',
          ),
        ),
      );
    }
  }

  Future<void> sendFcmToken(int accountId) async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      _.saveFcmToken(accountId: accountId, token: token);
    }
  }
}
