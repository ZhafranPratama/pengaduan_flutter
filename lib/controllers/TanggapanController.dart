import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as fetch ;
import 'package:pengaduan_masyarakat/models/TanggapanModel.dart';

class TanggapanController extends GetxController {
  RxBool loading = RxBool(false);
  RxList<TanggapanModel> data = RxList<TanggapanModel>([]);
  RxString msg = RxString("");

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData () async {
    try{
      data.value = [];
      loading.value = true;
      var response = await fetch.get(Uri.parse("http://192.168.235.94:5000/tanggapan")); // proses
      loading.value = false;
      final dataPengaduan = jsonDecode(response.body); // output
      for(Map<String,dynamic> pengaduan in dataPengaduan){
        data.add(TanggapanModel.fromJson(pengaduan));
      }
    }catch(e){
      print(e.toString());
    }
  }

  createData (data) async {
    try{
      loading.value = true;
      data["tgl_tanggapan"] = data["tgl_tanggapan"].toString();
      var response = await fetch.post(
        Uri.parse("http://192.168.235.94:5000/tanggapan"),
        body:jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      loading.value = false;
      getData();
    }catch(e){
      print(e.toString());
    }
  }

  updateData (data,id) async {
    try{
      loading.value = true;
      data["tgl_tanggapan"] = data["tgl_tanggapan"].toString();
      var response = await fetch.patch(
        Uri.parse("http://192.168.235.94:5000/tanggapan/${id}"),
        body:jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      loading.value = false;

      getData();
    }catch(e){
      print(e.toString());
    }
  }

  destroyData (id) async {
    try{
      loading.value = true;
      var response = await fetch.delete(
        Uri.parse("http://192.168.235.94:5000/tanggapan/${id}"),
      );
      loading.value = false;

      getData();
      if (response.statusCode == 200) {
        print("Data berhasil dihapus");
      } else {
        print("Gagal menghapus data. Status code: ${response.body}");
      }
    }catch(e){
      print(e.toString());
    }
  }

}