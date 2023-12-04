import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/MasyarakatController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class UpdateMasyarakat extends StatelessWidget {
  const UpdateMasyarakat({super.key});

  @override
  Widget build(BuildContext context) {
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    final index = masyarakatController.id.value;
    // ignore: invalid_use_of_protected_member
    final nik = masyarakatController.listmasyarakat.value[index].nik;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Masyarakat'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: masyarakatController.editNamaController,
            decoration: InputDecoration(labelText: 'Input Nama'),
          ),
          TextField(
            controller: masyarakatController.editUsernameController,
            decoration: InputDecoration(labelText: 'Input Username'),
          ),
          TextField(
            controller: masyarakatController.editPasswordController,
            decoration: InputDecoration(labelText: 'Input Password'),
          ),
          TextField(
            controller: masyarakatController.editTelpController,
            decoration: InputDecoration(labelText: 'Input No Telp'),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(homeScreen());
                masyarakatController.updateData(nik);
              },
              child: Text('Update'))
        ],
      ),
    );
  }
}
