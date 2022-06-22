// ignore_for_file: deprecated_member_use, prefer_const_constructors, unnecessary_new

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ongkir_oldver/app/locale/locale_keys.g.dart';
import './main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerCode;
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerStock;
  late TextEditingController controllerGambar;
  late TextEditingController controllerStatus;

  void editData() {
    var url = Uri.parse("http://10.0.2.2/my_store/editdata.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
      "gambar": controllerGambar.text,
      "status": controllerStatus.text
    });
  }

  @override
  void initState() {
    controllerCode =
        new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName =
        new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice =
        new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock =
        new TextEditingController(text: widget.list[widget.index]['stock']);
    controllerGambar =
        new TextEditingController(text: widget.list[widget.index]['gambar']);
    controllerStatus =
        new TextEditingController(text: widget.list[widget.index]['status']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(LocaleKeys.operasi4).tr(),
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
                  child: new Text(LocaleKeys.operasi4).tr(),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()));
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
