class PetugasModel {
  int? idPetugas;
  String? nama_petugas;
  String? username;
  String? password;
  String? telp;
  String? level;
  String? createdAt;
  String? updatedAt;

  PetugasModel(
      {this.idPetugas,
      this.nama_petugas,
      this.username,
      this.password,
      this.telp,
      this.level,
      this.createdAt,
      this.updatedAt});

  PetugasModel.fromJson(Map<String, dynamic> json) {
    idPetugas = json['id_petugas'];
    nama_petugas = json['nama_petugas'];
    username = json['username'];
    password = json['password'];
    telp = json['telp'];
    level = json['level'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_petugas'] = this.idPetugas;
    data['nama_petugas'] = this.nama_petugas;
    data['username'] = this.username;
    data['password'] = this.password;
    data['telp'] = this.telp;
    data['level'] = this.level;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
