import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/TanggapanController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class UpdateTanggapan extends StatelessWidget {
  const UpdateTanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    TanggapanController tanggapanController = Get.put(TanggapanController());
    var tanggapan = tanggapanController.data[index];
    Map data = {
      "id_pengaduan" : tanggapan.idPengaduan,
      "tanggapan" : tanggapan.tanggapan,
      "id_petugas" : tanggapan.idPetugas,
      "tgl_tanggapan" : tanggapan.tglTanggapan,
    };
    print(data);
    var hasil;
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          title:  const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child:SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: data["tanggapan"]),
                decoration:const InputDecoration(
                  label:Text("Tanggapan"),
                ),
                onChanged: (value) => data["tanggapan"] = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  hasil = await tanggapanController.updateData(data,tanggapan.idTanggapan);
                  print(hasil);
                  Get.to(homeScreen());
                },
                child:const Text("update"),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}