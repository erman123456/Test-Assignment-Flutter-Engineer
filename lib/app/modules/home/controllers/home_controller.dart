import 'dart:async';

import 'package:analog_clock_test/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final formKey = GlobalKey<FormState>();
  final hourCtrl = TextEditingController();
  final minuteCtrl = TextEditingController();
  final secondCtrl = TextEditingController();
  final isAlarmSet = false.obs;
  final hour = 00.obs;
  final minute = 00.obs;
  final second = 00.obs;

  int increment = 0;
  late Timer _timer;
  final dateTime = DateTime.now().obs;
  final count = 0.obs;
  @override
  void onInit() {
    timerRun();
    super.onInit();
  }

  void timerRun() {
    if (this.dateTime == null) dateTime.value = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      dateTime.value = dateTime.value.add(Duration(seconds: 1));
      int hourValidate = dateTime.value.hour;
      int minuteValidate = dateTime.value.minute;
      int secondValidate = dateTime.value.second;
      if (hourValidate == hour.value &&
          minuteValidate == minute.value &&
          secondValidate == second.value) {
        notificationShow(
          notificationTitle: 'alarm.set'.tr,
          notificationBody: 'Alaram Aktif Jam $hour : $minute : $second',
          payload: 'payload finish',
        );
        isAlarmSet.value = false;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void notificationShow({
    required String notificationTitle,
    required String notificationBody,
    required String payload,
  }) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      increment.toString(),
      notificationTitle,
      notificationBody,
      importance: Importance.max,
      priority: Priority.max,
      color: ColorsCustom.orange1,
      playSound: true,
      icon: '@mipmap/ic_launcher',
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(increment, notificationTitle,
        notificationBody, platformChannelSpecifics);

    // flutterLocalNotificationsPlugin.show(
    //   increment,
    //   notificationTitle,
    //   notificationBody,
    //   await NotificationDetails(
    // android: AndroidNotificationDetails(
    //   increment.toString(),
    //   notificationTitle,
    //   notificationBody,
    //   importance: Importance.max,
    //   priority: Priority.max,
    //   color: ColorsCustom.orange1,
    //   playSound: true,
    //   icon: '@mipmap/ic_launcher',
    // ),
    //     iOS: IOSNotificationDetails(
    //       sound: 'default.wav',
    //       presentAlert: true,
    //       presentBadge: true,
    //       presentSound: true,
    //     ),
    //   ),
    // );
    increment++;
  }

  void alarmSetVoid() {
    hour.value = int.parse(hourCtrl.text);
    minute.value = int.parse(minuteCtrl.text);
    second.value = int.parse(secondCtrl.text);

    hourCtrl.clear();
    minuteCtrl.clear();
    secondCtrl.clear();
    isAlarmSet.value = true;
  }
}
