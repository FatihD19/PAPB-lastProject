// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:ongkir_oldver/app/data/models/ongkir_model.dart';
import 'package:ongkir_oldver/app/locale/locale_keys.g.dart';
import 'package:ongkir_oldver/app/modules/home/views/languages.dart';
import 'package:ongkir_oldver/app/modules/home/views/main.dart';
import 'package:ongkir_oldver/app/modules/home/views/ongkir_view.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../main.dart';

void main() => runApp(HomeView());

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'BarangKurir',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Container(
                height: 166,
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(width: 50),
                      Text(
                        "Barang Kurir",
                        style:
                            new TextStyle(fontSize: 25, fontFamily: 'Monofett'),
                      ),
                      Icon(Icons.delivery_dining_sharp, size: 150),
                    ],
                  ),
                )),
            nextScreen: MyHomePage(
              title: '',
            ),
            splashTransition: SplashTransition.scaleTransition,
            pageTransitionType: PageTransitionType.leftToRight,
            backgroundColor: Colors.blue.shade600));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification!;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                // channel!.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Navigator.pushNamed(context, '/message',
      //     arguments: MessageArguments(message, true));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Barang Kurir'),
                  subtitle: Text(
                    LocaleKeys.desc,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ).tr(),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => Home(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 2));
                      },
                      child: const Text(LocaleKeys.open).tr(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => Languages(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 2));
                      },
                      child: const Text(LocaleKeys.bahasa).tr(),
                    ),
                  ],
                ),
                Image.network(
                    'https://i2.wp.com/www.indiaretailing.com/wp-content/uploads/2018/06/croma-networkbay.jpg?fit=681%2C400&ssl=1'),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Raja Ongkir'),
                  subtitle: Text(
                    LocaleKeys.fitur,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ).tr(),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => OngkirView(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 2));
                      },
                      child: const Text(LocaleKeys.open).tr(),
                    ),
                  ],
                ),
                Image.network(
                    'https://3.bp.blogspot.com/-yaifnhOuHyY/Wx-txbVCiYI/AAAAAAAAEYo/MicEudfJa8UXiyWSHnKw5ymvptITN-LkgCPcBGAYYCw/w1200-h630-p-k-no-nu/rajaongkir.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
