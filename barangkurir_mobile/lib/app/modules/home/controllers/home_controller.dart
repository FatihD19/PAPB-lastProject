// ignore_for_file: unused_import, unnecessary_string_interpolations, avoid_print, unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// ignore: unused_import
import '../../../data/models/ongkir_model.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController beratC = TextEditingController();
  RxBool isLoading = false.obs;

  List<Ongkir> ongkosKirim = [];
  RxString provAsalId = "0".obs;
  RxString cityAsalId = "0".obs;
  RxString provTujuanId = "0".obs;
  RxString cityTujuanId = "0".obs;

  RxString codeKurir = "".obs;

  cekOngkir() async {
    if (provAsalId != "0" &&
        cityAsalId != "0" &&
        provTujuanId != "0" &&
        cityTujuanId != "0" &&
        codeKurir != "") {
      try {
        isLoading.value = true;
        var response = await http.post(
          Uri.parse("https://api.rajaongkir.com/starter/cost"),
          headers: {
            "key": "7bb724f010ed080e7fcfcb9e635ce245",
            "content-type": "application/x-www-form-urlencoded",
          },
          body: {
            "origin": cityAsalId.value,
            "destination": cityTujuanId.value,
            "weight": beratC.text,
            "courier": codeKurir.value,
          },
        );
        isLoading.value = false;
        List ongkir = json.decode(response.body)["rajaongkir"]["results"][0]
            ["costs"] as List;
        ongkosKirim = Ongkir.fromJsonList(ongkir);

        Get.defaultDialog(
          title: "Ongkos Kirim",
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ongkosKirim
                .map(
                  (e) => ListTile(
                    title: Text("${e.service!.toUpperCase()}"),
                    subtitle: Text("Rp ${e.cost![0].value}"),
                  ),
                )
                .toList(),
          ),
        );

        // datanya.forEach((element) {
        //   print(element.toJson());
        // });

      } catch (e) {
        print(e);
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "tidak dapat cek ongkos kirim",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "data tidak lengkap",
      );
    }
  }
}
