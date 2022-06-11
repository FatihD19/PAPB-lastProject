// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:ongkir_oldver/app/data/models/ongkir_model.dart';
import 'package:ongkir_oldver/app/modules/home/views/main.dart';
import 'package:ongkir_oldver/app/modules/home/views/ongkir_view.dart';

void main() => runApp(HomeView());

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
                      onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new Home(),
                        ),
                      ),
                      child: const Text('OPEN'),
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
                      onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new OngkirView(),
                        ),
                      ),
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
