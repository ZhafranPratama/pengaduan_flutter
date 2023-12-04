import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/PengaduanController.dart';
import 'package:pengaduan_masyarakat/controllers/MasyarakatController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class UpdatePengaduan extends StatelessWidget {
  const UpdatePengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    PengaduanController pengaduanController = Get.put(PengaduanController());
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    print(masyarakatController.listmasyarakat);
    var pengaduan = pengaduanController.data[index];
    Map data = {
      "isi_laporan" : pengaduan.isiLaporan,
      "tgl_pengaduan" : pengaduan.tglPengaduan,
      "status" : pengaduan.status,
      "nik" : pengaduan.nik
    };
    var hasil;
    var url = 'http://192.168.127.94:5000/images/${pengaduan.foto}';
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
                controller: TextEditingController(text: data["isi_laporan"]),
                decoration:const InputDecoration(
                  label:Text("Isi Laporan"),
                ),
                onChanged: (value) => data["isi_laporan"] = value,
              ),
              TextField(
                decoration:const InputDecoration(
                  label:Text("Status"),
                ),
                controller: TextEditingController(text: data["status"]),
                onChanged: (value) => data["status"] = value ,
              ),
              const SizedBox(height: 20),
              Obx(() => pengaduanController.fileWeb["file"] == ""  ?
                Column(
                  children: [
                    Image.network(url,width: 200),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        pengaduanController.pickImage();
                      },
                      child:const Text("Update Image"),
                    ),
                  ],
                ) :
                GestureDetector(
                    onTap: () {
                      pengaduanController.pickImage();
                    },
                    child: Image.memory(pengaduanController.fileWeb["file"]!,width: 200)
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  hasil = await pengaduanController.updateData(data,pengaduan.idPengaduan);
                  if(hasil != "success") {
                    Get.snackbar("Error",hasil.toString());
                    return;
                  };
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