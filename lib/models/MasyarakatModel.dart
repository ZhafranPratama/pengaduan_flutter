class MasyarakatModel {
  String? nik;
  String? nama;
  String? username;
  String? password;
  String? telp;

  MasyarakatModel({nik, nama, username, password, telp});

  MasyarakatModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    username = json['username'];
    password = json['password'];
    telp = json['telp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nik'] = nik;
    data['nama'] = nama;
    data['username'] = username;
    data['password'] = password;
    data['telp'] = telp;
    return data;
  }
}
