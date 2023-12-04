import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/MasyarakatController.dart';
import 'package:pengaduan_masyarakat/home.dart';

class ReadMasyarakat extends StatelessWidget {
  const ReadMasyarakat({super.key});

  @override
  Widget build(BuildContext context) {
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Masyarakat'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(
          () => masyarakatController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: masyarakatController.listmasyarakat.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NIK : '
                              '${masyarakatController.listmasyarakat[index].nik}\nNama : ${masyarakatController.listmasyarakat[index].nama}\nUsername : ${masyarakatController.listmasyarakat[index].username}\nPassword : ${masyarakatController.listmasyarakat[index].password}\nNo Telp : ${masyarakatController.listmasyarakat[index].telp}'),
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
                                    Get.toNamed('/update',
                                        arguments: {"index": index});
                                    masyarakatController.getId(index);
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
                                    masyarakatController.deleteData(
                                        masyarakatController
                                            .listmasyarakat[index].nik);
                                    // ignore: invalid_use_of_protected_member
                                    masyarakatController.listmasyarakat.value
                                        .clear();
                                    masyarakatController.getData();
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
