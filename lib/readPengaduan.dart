import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/PengaduanController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class ReadPengaduan extends StatelessWidget {
  const ReadPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    PengaduanController pengaduanController = Get.put(PengaduanController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Masyarakat'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(
          () => pengaduanController.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: pengaduanController.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NIK : '
                              '${pengaduanController.data[index].nik}\nNama : ${pengaduanController.data[index].isiLaporan}\nUsername : ${pengaduanController.data[index].status}\n'),
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
                                    Get.toNamed("/updatePengaduan",
                                        arguments: {"index": index});
                                  },
                                  child: const Text("Edit")),
                              SizedBox(
                                width: 50,
                                height: 10,
                              ),
                              ElevatedButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.all(16.0),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    pengaduanController.destroyData(
                                        pengaduanController
                                            .data[index].idPengaduan);
                                    Get.to(homeScreen());
                                  },
                                  child: const Text("Hapus")),
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
