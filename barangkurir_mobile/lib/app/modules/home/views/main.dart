// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, unnecessary_new

import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ongkir_oldver/app/locale/locale_keys.g.dart';
import './Detail.dart';
import './adddata.dart';
import './home_view.dart';

void main() {
  runApp(new MaterialApp(
    title: "My Store",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2/my_store/getdata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context) => new MyHomePage(
                title: '',
              ),
            ),
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded, // add custom icons also
          ),
        ),
        title: new Text("MY KURIR"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new AddData(),
          ),
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data as List,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                  list: list,
                  index: i,
                ),
              ),
            ),
            child: Container(
              height: 265,
              child: new Card(
                elevation: 5,
                child: Column(
                  children: [
                    new ListTile(
                      title: new Text(list[i]['item_name']),
                      leading: Container(
                          child: list[i]['status'] == "terkirim"
                              ? Icon(Icons.check_box)
                              : Icon(Icons.warning)),
                      subtitle: Container(
                          child: Row(
                        children: [
                          Text(LocaleKeys.input).tr(),
                          new Text(" : ${list[i]['item_code']}"),
                        ],
                      )),
                    ),
                    Image.network(
                      '${list[i]['gambar']}',
                      height: 180,
                      width: 250,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
