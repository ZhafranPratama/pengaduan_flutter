import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/PetugasController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class CreatePetugas extends StatelessWidget {
  const CreatePetugas({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController petugasController = Get.put(PetugasController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Masyarakat'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: petugasController.idPetugasController,
            decoration: InputDecoration(labelText: 'Id Petugas'),
          ),
          TextField(
            controller: petugasController.namaPetugasController,
            decoration: InputDecoration(labelText: 'Input Nama'),
          ),
          TextField(
            controller: petugasController.usernameController,
            decoration: InputDecoration(labelText: 'Input Username'),
          ),
          TextField(
            controller: petugasController.passwordController,
            decoration: InputDecoration(labelText: 'Input Password'),
          ),
          TextField(
            controller: petugasController.telpController,
            decoration: InputDecoration(labelText: 'Input No Telp'),
          ),
          TextField(
            controller: petugasController.levelController,
            decoration: InputDecoration(labelText: 'Input Level'),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(homeScreen());
              petugasController.postData();
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
