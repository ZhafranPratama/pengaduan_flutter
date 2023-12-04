import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/PetugasController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class ReadPetugas extends StatelessWidget {
  const ReadPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController petugasController = Get.put(PetugasController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Petugas'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(
          () => petugasController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: petugasController.listpetugas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('IdPetugas : '
                              '${petugasController.listpetugas[index].idPetugas}\nNama : ${petugasController.listpetugas[index].nama_petugas}\nUsername : ${petugasController.listpetugas[index].username}\nPassword : ${petugasController.listpetugas[index].password}\nNo Telp : ${petugasController.listpetugas[index].telp}\n Level : ${petugasController.listpetugas[index].level}'),
                          Row(
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.all(16.0),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Get.toNamed('/updatePetugas',
                                        arguments: {"index": index});
                                    petugasController.getId(index);
                                  },
                                  child: Text(
                                    'Edit',
                                  )),
                              SizedBox(
                                width: 50,
                                height: 10,
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.all(16.0),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    petugasController.deleteData(petugasController.listpetugas[index].idPetugas);
                                    // ignore: invalid_use_of_protected_member
                                    petugasController.listpetugas.value.clear();
                                    petugasController.getData();
                                    Get.to(homeScreen());
                                  },
                                  child: Text(
                                    'Delete',
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
