// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkir_oldver/app/locale/locale_keys.g.dart';
import 'package:ongkir_oldver/app/modules/home/views/ongkir_view.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.index, required this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = Uri.parse("http://10.0.2.2/my_store/deleteData.php");
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: Row(
        children: [
          Text(
            LocaleKeys.alert,
            style: new TextStyle(color: Colors.black, fontSize: 13.0),
          ).tr(),
          new Text(
            "'${widget.list[widget.index]['item_name']}'",
            style: new TextStyle(fontSize: 13.0),
          ),
        ],
      ),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            LocaleKeys.operasi2,
            style: new TextStyle(color: Colors.black),
          ).tr(),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Home(),
            ));
          },
        ),
        new RaisedButton(
          child: new Text(LocaleKeys.operasi3,
                  style: new TextStyle(color: Colors.black))
              .tr(),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new Home(),
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_rounded, // add custom icons also
            ),
          ),
          title: new Text("${widget.list[widget.index]['item_name']}")),
      body: new Container(
        height: 770.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              new Image.network(
                "${widget.list[widget.index]['gambar']}",
                width: 300,
                height: 200,
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(LocaleKeys.input).tr(),
                subtitle: Text(
                  ": ${widget.list[widget.index]['item_code']}",
                  style: new TextStyle(fontSize: 15.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.price_change),
                title: Text(LocaleKeys.input2).tr(),
                subtitle: Text(
                  ": ${widget.list[widget.index]['price']}",
                  style: new TextStyle(fontSize: 15.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.scatter_plot),
                title: Text(LocaleKeys.input3).tr(),
                subtitle: Text(
                  ": ${widget.list[widget.index]['stock']} gram",
                  style: new TextStyle(fontSize: 15.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(LocaleKeys.input5).tr(),
                subtitle: Text(
                  ": ${widget.list[widget.index]['status']}",
                  style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text(LocaleKeys.operasi4).tr(),
                    color: Colors.yellow.shade600,
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new EditData(
                        list: widget.list,
                        index: widget.index,
                      ),
                    )),
                  ),
                  new RaisedButton(
                      child: new Text("Cek Ongkir").tr(),
                      color: Colors.blue.shade600,
                      onPressed: () {
                        Get.to(() => OngkirView(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 2));
                      }),
                  new RaisedButton(
                    child: new Text(LocaleKeys.operasi2).tr(),
                    color: Colors.red.shade600,
                    onPressed: () => confirm(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }

