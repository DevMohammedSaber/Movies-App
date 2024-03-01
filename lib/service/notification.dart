import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
      }
    });
    getToken();
    initPushNotification();
  }

  void getToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      final tokens = FirebaseFirestore.instance.collection('tokens');
      final documentSnapShot = await tokens.doc(token).get();
      final currentToken = documentSnapShot.data();
      if (currentToken?['token'] != token) {
        await tokens
            .doc(token)
            .set({'token': token})
            .then((value) => print(token))
            .onError(
                (error, stackTrace) => print("Failed to add token: $error"));
      } else {
        print(token);
      }
    } on Exception catch (e) {
      throw 'Token not save in the server! $e';
    }
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    print('==================================${message.data}');
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
