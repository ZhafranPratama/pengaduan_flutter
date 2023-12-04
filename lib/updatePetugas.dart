import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/PetugasController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class UpdatePetugas extends StatelessWidget {
  const UpdatePetugas({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController petugasController = Get.put(PetugasController());
    final index = petugasController.id.value;
    // ignore: invalid_use_of_protected_member
    final id = petugasController.listpetugas.value[index].idPetugas;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Masyarakat'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: petugasController.editNamaPetugasController,
            decoration: InputDecoration(labelText: 'Input Nama'),
          ),
          TextField(
            controller: petugasController.editUsernameController,
            decoration: InputDecoration(labelText: 'Input Username'),
          ),
          TextField(
            controller: petugasController.editPasswordController,
            decoration: InputDecoration(labelText: 'Input Password'),
          ),
          TextField(
            controller: petugasController.editTelpController,
            decoration: InputDecoration(labelText: 'Input No Telp'),
          ),
          TextField(
            controller: petugasController.editLevelController,
            decoration: InputDecoration(labelText: 'Admin, Petugas'),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(homeScreen());
                petugasController.updateData(id);
              },
              child: Text('Update'))
        ],
      ),
    );
  }
}
