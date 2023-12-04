import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/MasyarakatController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class CreateMasyarakat extends StatelessWidget {
  const CreateMasyarakat({super.key});

  @override
  Widget build(BuildContext context) {
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Masyarakat'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: masyarakatController.nikController,
            decoration: InputDecoration(labelText: 'Input NIK'),
          ),
          TextField(
            controller: masyarakatController.namaController,
            decoration: InputDecoration(labelText: 'Input Nama'),
          ),
          TextField(
            controller: masyarakatController.usernameController,
            decoration: InputDecoration(labelText: 'Input Username'),
          ),
          TextField(
            controller: masyarakatController.passwordController,
            decoration: InputDecoration(labelText: 'Input Password'),
          ),
          TextField(
            controller: masyarakatController.telpController,
            decoration: InputDecoration(labelText: 'Input No Telp'),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(homeScreen());
              masyarakatController.postData();
            },
            child: Text('Submit'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
