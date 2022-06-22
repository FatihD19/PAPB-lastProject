// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:ongkir_oldver/app/data/models/ongkir_model.dart';
import 'package:ongkir_oldver/app/modules/home/views/main.dart';
import 'package:ongkir_oldver/app/modules/home/views/ongkir_view.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../main.dart';

void main() => runApp(HomeView());

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BarangKurir',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Container(
                height: 100,
                child: Column(
                  children: [
                    Icon(Icons.delivery_dining_sharp, size: 66),
                    Text("Barang Kurir"),
                  ],
                )),
            nextScreen: MyHomePage(
              title: '',
            ),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            backgroundColor: Colors.blue));
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
                  title: const Text('Me Store'),
                  subtitle: Text(
                    'Api Server',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Menampilkan data daftar barang yang berasal dari Api yang berada di server Virtual Machine.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => Home(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 2));
                      },
                      child: const Text('OPEN'),
                    ),
                    TextButton(
                      onPressed: () async {
                        String? token =
                            await FirebaseMessaging.instance.getToken();
                        print(token);
                      },
                      child: const Text('TOKEN'),
                    )
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
                    'Public Api',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Raja Ongkir adalah public Api yang menyediakan data-data tarif ongkir antar kota di indonesia.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => OngkirView(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 2));
                      },
                      child: const Text('OPEN'),
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
