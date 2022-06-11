// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, unnecessary_new

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
              builder: (BuildContext context) => new MyHomePage(),
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
              height: 250,
              child: new Card(
                elevation: 5,
                child: Column(
                  children: [
                    new ListTile(
                      title: new Text(list[i]['item_name']),
                      leading: new Icon(
                        Icons.shopping_bag,
                        size: 30.0,
                      ),
                      subtitle: new Text(
                          "Lokasi : ${list[i]['item_code']}\nPrice : Rp. ${list[i]['price']}"),
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
