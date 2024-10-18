import 'package:blott_app/features/feeds/presentation/screens/feeds.dart';
import 'package:blott_app/util/storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final welcomeProvider = ChangeNotifierProvider((ref) => WelcomeProvider());

class WelcomeProvider extends ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  bool isEnabled = false;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  checkValidity() {
    if (firstName.text.isNotEmpty && lastName.text.isNotEmpty) {
      isEnabled = true;
      notifyListeners();
    } else {
      isEnabled = false;
      notifyListeners();
    }
  }

  saveName() {
    Storage.prefs.setString("name", "${firstName.text} ${lastName.text}");
  }

  bool fetchOnboardedStatus() {
    return Storage.prefs.getBool("onboarded") ?? false;
  }

  showNotificationPopUp(BuildContext context) async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Feeds()));
      saveName();
      Storage.prefs.setBool("onboarded", true);
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Feeds()));
      Storage.prefs.setBool("onboarded", true);
      saveName();
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
