import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as axios;
import 'package:pengaduan_masyarakat/models/PetugasModel.dart';

class PetugasController extends GetxController {
  RxInt show = RxInt(0);
  RxBool isLoading = RxBool(false);

  RxList<PetugasModel> listpetugas = RxList<PetugasModel>([]);

  TextEditingController idPetugasController = TextEditingController();
  TextEditingController namaPetugasController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController levelController = TextEditingController();

  TextEditingController editNamaPetugasController = TextEditingController();
  TextEditingController editUsernameController = TextEditingController();
  TextEditingController editPasswordController = TextEditingController();
  TextEditingController editTelpController = TextEditingController();
  TextEditingController editLevelController = TextEditingController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      isLoading.value == true;
      var res =
          await axios.get(Uri.parse('http://localhost:5000/petugas'));
      print(res);

      if (res.statusCode == 200) {
        isLoading.value == false;
        final content = jsonDecode(res.body);
        for (Map<String, dynamic> i in content) {
          listpetugas.add(PetugasModel.fromJson(i));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> postData() async {
    final Map<String, dynamic> datas = {
      "id_petugas": idPetugasController.text,
      "nama_petugas": namaPetugasController.text,
      "username": usernameController.text,
      "password": passwordController.text,
      "telp": telpController.text,
      "level": levelController.text,
    };

    final response = await axios.post(
        Uri.parse('http://localhost:5000/petugas'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(datas));
    if (response.statusCode == 201) {
      // ignore: invalid_use_of_protected_member
      listpetugas.value.clear();
      getData();
      return true;
    } else {
      return false;
    }
  }

  final id = 0.obs;

  void getId(int ids) async {
    id.value = ids;
  }

  Future<bool> updateData(id) async {
    final Map<String, dynamic> datas = {
      "nama_petugas": editNamaPetugasController.text,
      "username": editUsernameController.text,
      "password": editPasswordController.text,
      "telp": editTelpController.text,
      "level": editLevelController.text,
    };
    final response = await axios.patch(
        Uri.parse('http://localhost:5000/petugas/${id}'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(datas));
    if (response.statusCode == 201) {
      // ignore: invalid_use_of_protected_member
      listpetugas.value.clear();
      getData();
      return true;
    } else {
      return false;
    }
  }

  void getId2(int ids) async {
    id.value = ids;
  }

  Future<bool> deleteData(id) async {
    final response = await axios.delete(
        Uri.parse('http://localhost:5000/petugas/${id}'),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
