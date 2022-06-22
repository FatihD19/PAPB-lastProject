// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ongkir_oldver/app/locale/locale_keys.g.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();
  TextEditingController controllerGambar = new TextEditingController();
  TextEditingController controllerStatus = new TextEditingController();

  void addData() {
    var url = Uri.parse("http://10.0.2.2/my_store/adddata.php");

    http.post(url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
      "gambar": controllerGambar.text,
      "status": controllerStatus.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(LocaleKeys.operasi1).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                      hintText: (LocaleKeys.input).tr(),
                      labelText: (LocaleKeys.input).tr()),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: (LocaleKeys.input4).tr(),
                      labelText: (LocaleKeys.input4).tr()),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                      hintText: (LocaleKeys.input2).tr(),
                      labelText: (LocaleKeys.input2).tr()),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                      hintText: (LocaleKeys.input3).tr(),
                      labelText: (LocaleKeys.input3).tr()),
                ),
                new TextField(
                  controller: controllerGambar,
                  decoration: new InputDecoration(
                      hintText: (LocaleKeys.input6).tr(), labelText: "link "),
                ),
                new TextField(
                  controller: controllerStatus,
                  decoration: new InputDecoration(
                      hintText: (LocaleKeys.input5).tr(),
                      labelText: (LocaleKeys.input5).tr()),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text(LocaleKeys.operasi1).tr(),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
