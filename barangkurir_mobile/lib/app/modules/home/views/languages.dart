import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Languages extends StatefulWidget {
  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            title: Text('Indonesia'),
            trailing: Icon(Icons.arrow_right),
            onTap: () async {
              Navigator.pop(context);
              context.setLocale(Locale('id'));
            },
          ),
          ListTile(
            title: Text('English'),
            trailing: Icon(Icons.arrow_right),
            onTap: () async {
              Navigator.pop(context);
              context.setLocale(Locale('en'));
            },
          ),
          ListTile(
            title: Text('Arab'),
            trailing: Icon(Icons.arrow_right),
            onTap: () async {
              Navigator.pop(context);
              context.setLocale(Locale('ar'));
            },
          ),
          // ListTile(
          //   title: Text('English'),
          //   trailing: Icon(Icons.arrow_right),
          //   onTap: () async => context.setLocale(Locale('en')),
          // ),
          // ListTile(
          //   title: Text('Arab'),
          //   trailing: Icon(Icons.arrow_right),
          //   onTap: () async => context.setLocale(Locale('ar')),
          // ),
        ],
      ),
    );
  }
}
