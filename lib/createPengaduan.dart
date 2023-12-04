import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/MasyarakatController.dart';
import 'package:pengaduan_masyarakat/controllers/PengaduanController.dart';
import 'package:intl/intl.dart';
import 'package:pengaduan_masyarakat/home.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CreatePengaduan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatePengaduan();
  }
}

class _CreatePengaduan extends State<CreatePengaduan> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map data = {};
    var hasil;
    PengaduanController pengaduanController = Get.put(PengaduanController());
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    print(masyarakatController.listmasyarakat);
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          title: const Text("Pengaduan Masyarakat",
              style: TextStyle(color: Colors.white))),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text("Isi Laporan"),
                ),
                onChanged: (value) => data["isi_laporan"] = value,
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text("Status"),
                ),
                onChanged: (value) => data["status"] = value,
              ),
              TextField(
                controller: dateinput,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);

                    data["tgl_pengaduan"] = formattedDate;
                    dateinput.text = formattedDate;
                  } else {
                    print("Date is not selected");
                  }
                },
                onChanged: (value) => data["tgl_pengaduan"] = dateinput.text,
              ),
              Obx(() =>
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Expanded(
                              child: Text('Pilih Masyarakat',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.black26),
                            color: Colors.blue,
                          ),
                          elevation: 2,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.blue,
                          ),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all(6),
                            thumbVisibility: MaterialStateProperty.all(true),
                          ),
                        ),
                        items: masyarakatController.listmasyarakat.map((masyarakat) => DropdownMenuItem(
                          value: masyarakat.nik,
                          child: Text(masyarakat.nama.toString(),style: const TextStyle(fontSize: 14,color: Colors.white)),
                        )).toList(),
                        value: data["nik"],
                        onChanged: (String? value) => data["nik"] = value!,
                      ),
                    ),
                ),
              const SizedBox(height: 20),
              Obx(
                () => !pengaduanController.web.value
                    ? ElevatedButton(
                        onPressed: () {
                          pengaduanController.pickImage();
                        },
                        child: const Text("File Image"),
                      )
                    : Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                pengaduanController.pickImage();
                              },
                              child: Image.memory(
                                  pengaduanController.fileWeb["file"],
                                  width: 200)),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              pengaduanController.pickImage();
                            },
                            child: const Text("File Image"),
                          )
                        ],
                      ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  hasil = await pengaduanController.createData(data);
                  print(hasil);
                  if (hasil != "success") {
                    Get.snackbar("Error", hasil.toString());
                    return;
                  }
                  ;
                  Get.to(homeScreen());
                },
                child: const Text("Create"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
