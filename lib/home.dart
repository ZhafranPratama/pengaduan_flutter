import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.toNamed('/create');
                  },
                  child: Text(
                    'Create Masyarakat',
                  )),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.toNamed('/read');
                  },
                  child: Text(
                    'Read Masyarakat',
                  )),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.toNamed('/createPetugas');
                  },
                  child: Text(
                    'Create Petugas',
                  )),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.toNamed('/readPetugas');
                  },
                  child: Text(
                    'Read Petugas',
                  )),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.toNamed('/createPengaduan');
                  },
                  child: Text(
                    'Create Pengaduan',
                  )),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.toNamed('/readPengaduan');
                  },
                  child: Text(
                    'Read Pengaduan',
                  )),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.toNamed('/createTanggapan');
                  },
                  child: Text(
                    'Create Tanggapan',
                  )),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.toNamed('/readTanggapan');
                  },
                  child: Text(
                    'Read Tanggapan',
                  )),
            ),
          ],
        ));
  }
}
