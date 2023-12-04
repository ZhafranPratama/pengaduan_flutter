import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat/models/MasyarakatModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as axios;

class MasyarakatController extends GetxController {
  RxInt show = RxInt(0);
  RxBool isLoading = RxBool(false);

  RxList<MasyarakatModel> listmasyarakat = RxList<MasyarakatModel>([]);

  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController telpController = TextEditingController();

  TextEditingController editNamaController = TextEditingController();
  TextEditingController editUsernameController = TextEditingController();
  TextEditingController editPasswordController = TextEditingController();
  TextEditingController editTelpController = TextEditingController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      isLoading.value == true;
      var res =
          await axios.get(Uri.parse('http://192.168.127.94:5000/masyarakat'));
      print(res);

      if (res.statusCode == 200) {
        isLoading.value == false;
        final content = jsonDecode(res.body);
        for (Map<String, dynamic> i in content) {
          listmasyarakat.add(MasyarakatModel.fromJson(i));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> postData() async {
    final Map<String, dynamic> datas = {
      "nik": nikController.text,
      "nama": namaController.text,
      "username": usernameController.text,
      "password": passwordController.text,
      "telp": telpController.text,
    };

    final response = await axios.post(
        Uri.parse('http://192.168.127.94:5000/masyarakat'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(datas));
    if (response.statusCode == 201) {
      // ignore: invalid_use_of_protected_member
      listmasyarakat.value.clear();
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

  Future<bool> updateData(nik) async {
    final Map<String, dynamic> datas = {
      "nama": editNamaController.text,
      "username": editUsernameController.text,
      "password": editPasswordController.text,
      "telp": editTelpController.text,
    };
    final response = await axios.patch(
        Uri.parse('http://192.168.127.94:5000/masyarakat/${nik}'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(datas));
    if (response.statusCode == 201) {
      // ignore: invalid_use_of_protected_member
      listmasyarakat.value.clear();
      getData();
      return true;
    } else {
      return false;
    }
  }

  void getId2(int ids) async {
    id.value = ids;
  }

  Future<bool> deleteData(nik) async {
    final response = await axios.delete(
        Uri.parse('http://192.168.127.94:5000/masyarakat/${nik}'),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
