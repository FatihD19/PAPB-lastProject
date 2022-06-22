// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "input": "موقع",
  "input2": "سعر",
  "input3": "ثقيل",
  "operasi1": "إضافة البيانات",
  "operasi2": "حذف",
  "operasi3": "ألغيت",
  "operasi4": "تحرير البيانات",
  "input4": "أسماء الجيدون",
  "alert": "أنت متأكد من أنك ستحذف العناصر",
  "rjin1": "مقاطعة الأصل",
  "rjin2": "مسقط رأس",
  "rjin3": "المقاطعة المقصد",
  "rjin4": "المدينة الوجهة",
  "rjin5": "اختر ساعيًا",
  "input5": "وصف",
  "input6": "صورة",
  "fitur": "ميزة",
  "desc": "قائمة العناصر المراد إرسالها",
  "open": "فتح",
  "bahasa": "لغة"
};
static const Map<String,dynamic> en = {
  "input": "location",
  "input2": "price",
  "input3": "heavy",
  "operasi1": "Add data",
  "operasi2": "DELETE",
  "operasi3": "CANCELLED",
  "operasi4": "Edit data",
  "input4": "name of goods",
  "alert": "You are sure you will delete items",
  "rjin1": "Province of origin",
  "rjin2": "Hometown",
  "rjin3": "Destination Province",
  "rjin4": "Destination city",
  "rjin5": "Choose a courier",
  "input5": "status",
  "input6": "picture",
  "fitur": "Feature",
  "desc": "List of items to be sent",
  "open": "Open",
  "bahasa": "language"
};
static const Map<String,dynamic> id = {
  "input": "lokasi",
  "input2": "harga",
  "input3": "berat",
  "operasi1": "Tambah Data",
  "operasi2": "HAPUS",
  "operasi3": "BATAL",
  "operasi4": "Edit data",
  "input4": "nama barang",
  "alert": "Anda yakin akan menghapus barang",
  "rjin1": "Provinsi Asal",
  "rjin2": "Kota Asal",
  "rjin3": "Provinsi Tujuan",
  "rjin4": "Kota Tujuan",
  "rjin5": "pilih kurir",
  "input5": "keterangan",
  "input6": "gambar",
  "fitur": "fitur",
  "desc": "Daftar barang yang harus dikirm",
  "open": "Open",
  "bahasa": "bahasa"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en, "id": id};
}
