import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/TanggapanController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class ReadTanggapan extends StatelessWidget {
  const ReadTanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    TanggapanController tanggapanController = Get.put(TanggapanController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Tanggapan'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(
              () => tanggapanController.loading.value
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
            itemCount: tanggapanController.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Id Tanggapan : '
                        '${tanggapanController.data[index].idTanggapan}\nId Pengaduan : ${tanggapanController.data[index].idPengaduan}\nTanggapan : ${tanggapanController.data[index].tanggapan}\nTanggal Tanggapan : ${tanggapanController.data[index].tglTanggapan}\nId Petugas : ${tanggapanController.data[index].idPetugas}\n'),
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
                              Get.toNamed("/updateTanggapan",
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
                              tanggapanController.destroyData(
                                  tanggapanController.data[index].idTanggapan);
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
