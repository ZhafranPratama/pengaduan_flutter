import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat/createMasyarakat.dart';
import 'package:pengaduan_masyarakat/createTanggapan.dart';
import 'package:pengaduan_masyarakat/readMasyarakat.dart';
import 'package:pengaduan_masyarakat/readTanggapan.dart';
import 'package:pengaduan_masyarakat/updateMasyarakat.dart';

import 'package:pengaduan_masyarakat/createPengaduan.dart';
import 'package:pengaduan_masyarakat/readPengaduan.dart';
import 'package:pengaduan_masyarakat/updatePengaduan.dart';

import 'package:pengaduan_masyarakat/createPetugas.dart';
import 'package:pengaduan_masyarakat/readPetugas.dart';
import 'package:pengaduan_masyarakat/updatePetugas.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/home.dart';
import 'package:pengaduan_masyarakat/updateTanggapan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: () => MyApp()),
        GetPage(name: "/create", page: () => CreateMasyarakat()),
        GetPage(name: "/read", page: () => ReadMasyarakat()),
        GetPage(name: "/update", page: () => UpdateMasyarakat()),

        GetPage(name: "/readPetugas", page: () => ReadPetugas()),
        GetPage(name: "/createPetugas", page: () => CreatePetugas()),
        GetPage(name: "/updatePetugas", page: () => UpdatePetugas()),

        GetPage(name: "/readPengaduan", page: () => ReadPengaduan()),
        GetPage(name: "/createPengaduan", page: () => CreatePengaduan()),
        GetPage(name: "/updatePengaduan", page: () => UpdatePengaduan()),

        GetPage(name: "/readTanggapan", page: () => ReadTanggapan()),
        GetPage(name: "/createTanggapan", page: () => CreateTanggapan()),
        GetPage(name: "/updateTanggapan", page: () => UpdateTanggapan()),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: homeScreen(),
    );
  }
}
