import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as axios;
import 'package:pengaduan_masyarakat/models/PengaduanModel.dart';

class PengaduanController extends GetxController{
  RxBool loading = RxBool(false);
  RxList<PengaduanModel> data = RxList<PengaduanModel>([]);
  RxBool web = RxBool(false);
  PlatformFile? imagePicked;
  RxMap fileWeb = RxMap({
    "file": ""
  });

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData () async {
    try{
      data.value = [];
      loading.value = true;
      var response = await axios.get(Uri.parse("http://localhost:5000/pengaduan"));
      loading.value = false;
        final dataPengaduan = jsonDecode(response.body);
        for(Map<String,dynamic> pengaduan in dataPengaduan){
          data.add(PengaduanModel.fromJson(pengaduan));
        }
    }catch(e){
      print(e.toString());
    }
  }

  createData (Map data) async {
    if(data["status"] != "0" && data["status"] != "proses" && data["status"] != "selesai") return "Status antara proses,selesai atau 0";
    if(!web.value) return "tidak ada gambar";

    final url = Uri.parse('http://localhost:5000/pengaduan');
    var request = axios.MultipartRequest('POST', url);
    request.files.add(
      axios.MultipartFile.fromBytes(
        'foto',
        Uint8List.fromList(imagePicked!.bytes!),
        filename: imagePicked!.name!,
      ),
    );

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var response = await request.send();
    final responseBody = await response.stream.bytesToString();
    getData();
    web.value = false;
    return "success";
  }

 
  updateData (Map data,id) async {
    if(data["status"] != "0" && data["status"] != "proses" && data["status"] != "selesai") return "Status antara proses,selesai atau 0";

    final url = Uri.parse('http://localhost:5000/pengaduan/${id}');
    var request = axios.MultipartRequest('PATCH', url);
    if(imagePicked != null){
      request.files.add(
        axios.MultipartFile.fromBytes(
          'foto',
          Uint8List.fromList(imagePicked!.bytes!),
          filename: imagePicked!.name!,
        ),
      );
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var response = await request.send();
    final responseBody = await response.stream.bytesToString();
    print(responseBody);
    fileWeb["file"] = "";
    getData();
    return "success";
  }


  destroyData (id) async {
    try{
      loading.value = true;
      var response = await axios.delete(
        Uri.parse("http://localhost:5000/pengaduan/${id}"),
      );
      loading.value = false;

      getData();
    }catch(e){
      print(e.toString());
    }
  }
  pickImage () async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if(result == null) return false;
    imagePicked = result.files.obs.last;
    fileWeb["file"] = Uint8List.fromList(imagePicked!.bytes!);
    web.value = true;
  }
}