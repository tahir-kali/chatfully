
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:chatfully/Global.dart';
import 'package:chatfully/Screens/Chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/LoginScreen.dart';
import 'main.dart';
import 'spscreendart.dart';
import 'colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/subjects.dart';
class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}
class _SplashScreensState extends State<SplashScreens> {
  bool check = false;
  String uid;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  getScreen() async {

  print(uid);

  if (uid!=null){
    check = true;
  }
  else {
    check = false;
  }

  print(check);
  }
  _checkUserData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("s") == null) {
      check = false;
      return false;
    }
    else {
      userData = preferences.getString("s");
      check = true;
      print(userData);
      return true;
    }
  }
  void _requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  Future<void> _showNotification(String title , String message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, title, message, platformChannelSpecifics,
        payload: 'item x');
  }
  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body)
              : null,
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
//                await Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) =>
//                        SecondScreen(receivedNotification.payload),
//                  ),
//                );
              },
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
//      await Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => SecondScreen(payload)),
//      );
    });
  }

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        final notification1 = LocalNotification("notification", message['data'] as Map);
        NotificationsBloc.instance.newNotification(notification1);
        print("onMessage: $message");
        Map notification = message["notification"] ;
        var data = message["data"];
        currentNotiUser1 = data["userId"] as String;
        print( "notify user is  $currentNotiUser1");
        _showNotification(notification["title"], notification["body"]);

      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        isNotification = true;
        var data = message["data"];
        currentNotiUser1 = data["userId"];
        print( "notify user is  $currentNotiUser1");
//        _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        isNotification = true;
        var data = message["data"];
        currentNotiUser1 = data["userId"];
        print(currentNotiUser1);
//        _navigateToItemDetail(message);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
//        _homeScreenText = "Push Messaging token: $token";
      });
     print("token is  " + token);
      fcmToken = token;
    });
    this._checkUserData();
    Future.delayed(Duration(milliseconds: 4000),(){
      print(this.check);
      if (this.check) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()),);
      }
      else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 197, 207, 1),
      child: Center(

        child: Container(
            child: Image.asset("assets/splashLogo.png",fit: BoxFit.contain,)),
      ),
    );
      
    
  }
}
class LocalNotification {
final String type;
final Map data;

LocalNotification(this.type, this.data);
}

class NotificationsBloc {
  NotificationsBloc._internal();

  static final NotificationsBloc instance = NotificationsBloc._internal();

  final BehaviorSubject<LocalNotification> _notificationsStreamController = BehaviorSubject<LocalNotification>();

  Stream<LocalNotification> get notificationsStream {
    return _notificationsStreamController;
  }

  void newNotification(LocalNotification notification) {
    _notificationsStreamController.sink.add(notification);
  }

  void dispose() {
    _notificationsStreamController?.close();
  }
}