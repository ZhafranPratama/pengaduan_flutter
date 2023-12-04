import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat/controllers/TanggapanController.dart';
import 'package:pengaduan_masyarakat/controllers/PengaduanController.dart';
import 'package:intl/intl.dart';
import 'package:pengaduan_masyarakat/home.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'controllers/PetugasController.dart';

class CreateTanggapan extends StatefulWidget {
  const CreateTanggapan({super.key});

  @override
  State<CreateTanggapan> createState() => _CreateTanggapanState();
}

class _CreateTanggapanState extends State<CreateTanggapan> {
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
    TanggapanController tanggapanController = Get.put(TanggapanController());
    PetugasController petugasController = Get.put(PetugasController());
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
                  label: Text("Id Tanggapan"),
                ),
                onChanged: (value) => data["id_tanggapan"] = value,
              ),
              Obx(() =>
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<int>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text('Pilih Id Pengaduan',
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
                      items: pengaduanController.data.map((masyarakat) => DropdownMenuItem(
                        value: masyarakat.idPengaduan,
                        child: Text(masyarakat.idPengaduan.toString(),style: const TextStyle(fontSize: 14,color: Colors.white)),
                      )).toList(),
                      value: data["id_pengaduan"],
                      onChanged: (int? value) => data["id_pengaduan"] = value!,
                    ),
                  ),
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text("Tanggapan"),
                ),
                onChanged: (value) => data["tanggapan"] = value,
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

                    data["tgl_tanggapan"] = formattedDate;
                    dateinput.text = formattedDate;
                  } else {
                    print("Date is not selected");
                  }
                },
                onChanged: (value) => data["tgl_tanggapan"] = dateinput.text,
              ),
              Obx(() =>
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<Object>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text('Pilih Id Petugas',
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
                      items: petugasController.listpetugas.map((petugas) => DropdownMenuItem(
                        value: petugas.idPetugas,
                        child: Text(petugas.idPetugas.toString(),style: const TextStyle(fontSize: 14,color: Colors.white)),
                      )).toList(),
                      value: data["id_petugas"],
                      onChanged: (Object? value) => data["id_petugas"] = value!,
                    ),
                  ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  hasil = await tanggapanController.createData(data);
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
