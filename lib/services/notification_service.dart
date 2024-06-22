// // 🎯 Dart imports:
// import 'dart:developer';
// import 'dart:io';

// 
// import 'package:flutter/material.dart';

// 
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;

// 


// 


// // import 'package:timezone/timezone.dart' as tz;

// class NotificationService {
//   const NotificationService._();

//   static late final String? fcmToken;

//   static late final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

//   static late final AndroidNotificationChannel _channel;

//   static late bool _isFlutterLocalNotificationsInitialized;

//   //*.//////////////.*//
//   //*.initialization.*//
//   //*.//////////////.*//

//   static Future<void> init() async {
//     try {
//       tz.initializeTimeZones();
//       await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//       fcmToken = await FirebaseMessaging.instance.getToken();
//       // getIt<LocalStorage>().setValue(storageKeys: StorageKeys.fcmToken, value: fcmToken ?? 'Device Token'); //TOOD HANDEL IT IN ANOTHER WAY
//       log(fcmToken ?? 'no FCM Token'.logWhite, name: 'FCM token');

//       const AndroidInitializationSettings initializationSettingsAndroid =
//           AndroidInitializationSettings('@mipmap/ic_launcher');

//       const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();

//       const InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsDarwin,
//       );

//       _isFlutterLocalNotificationsInitialized = false;
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin()
//         ..initialize(initializationSettings);

//       await _requestPermission();
//       await _setupFlutterNotifications();

//       final token = await FirebaseMessaging.instance.getToken();
//       log(token.logWhite, name: 'FCM Token');

//       FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

//       _startListening();
//     } catch (e) {}
//   }

//   static Future<void> periodicallyShowNotification({
//     required DateTime dateTime,
//     required int id,
//     String? title,
//     String? body,
//     String? payload,
//     String? customSound,
//     DateTimeComponents? matchDateTimeComponents,
//   }) async {
//     await _flutterLocalNotificationsPlugin.periodicallyShow(
//       id,
//       title,
//       body,
//       RepeatInterval.daily,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           customSound ?? "channel2",
//           "channel2",
//           icon: "ic_launcher",
//           importance: Importance.max,
//           priority: Priority.max,
//           playSound: true,
//           sound: customSound == null ? null : RawResourceAndroidNotificationSound(customSound),
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.alarmClock,
//       payload: payload,
//     );
//   }

//   static Future<List<PendingNotificationRequest>> getPendingNotifications() async {
//     return await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
//   }

//   // static cancelNotification(int id) async {
//   //   debugPrint('notification $id canceled');
//   //   await _flutterLocalNotificationsPlugin.cancel(id);
//   // }

//   static cancelAllNotification() async => await _flutterLocalNotificationsPlugin.cancelAll();

//   //*.///////////////.*//
//   //*.private methods.*//
//   //*.///////////////.*//
//   static void _startListening() => FirebaseMessaging.onMessage.listen(_showNotification);

//   static Future<void> _requestPermission() async {
//     if (Platform.isAndroid) {
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//       flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
//           .requestNotificationsPermission();
//     } else if (Platform.isIOS) {
//       await _flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()!
//           .requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//             critical: true,
//           );
//     }
//   }

//   static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//     await _setupFlutterNotifications();
//     _showNotification(message);
//     log('Handling a background message: ${message.messageId}'.logWhite);
//   }

//   static Future<void> _setupFlutterNotifications() async {
//     if (_isFlutterLocalNotificationsInitialized) return;

//     _channel = const AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       description: 'This channel is used for important notifications.', // description
//       importance: Importance.high,
//     );

//     /// We use this channel in the `AndroidManifest.xml` file to override the
//     /// default FCM channel to enable heads up notifications.
//     await _flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(_channel);

//     /// Update the iOS foreground notification presentation options to allow
//     /// heads up notifications.
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     _isFlutterLocalNotificationsInitialized = true;
//   }

//   static void _showNotification(RemoteMessage message) {
//     Map notification = message.data;

//     _flutterLocalNotificationsPlugin.show(
//       message.hashCode,
//       notification['title'],
//       notification['body'],
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           _channel.id,
//           _channel.name,
//           channelDescription: _channel.description,
//           color: const Color(0xffFF634D),
//           playSound: true,
//           icon: '@mipmap/ic_launcher',
//           importance: Importance.max,
//         ),
//         iOS: const DarwinNotificationDetails(
//           presentAlert: true,
//           presentBadge: true,
//           presentBanner: true,
//           presentList: true,
//           presentSound: true,
//           interruptionLevel: InterruptionLevel.timeSensitive,
//         ),
//       ),
//     );
//   }
// }
