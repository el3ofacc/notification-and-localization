import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notification/components/applocal.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void makenotification() async{
    if (!await AwesomeNotifications().isNotificationAllowed()) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: "channelKey",
          title: 'my notification title',
          body: 'my notification body',
          bigPicture: "resource://drawable/images",
          notificationLayout: NotificationLayout.BigPicture),
    );
  }

  @override
  // void initState() {
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              makenotification();
            },
            child: Text("${getLang(context, "hello_world")}")),
      ),
    );
  }
}
