import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.id,
        required this.uuid,
        required this.userNoNik,
        required this.password,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.noKk,
        required this.noNik,
        required this.namaLengkap,
        required this.tempatLahir,
        required this.tanggalLahir,
        required this.shdk,
        required this.alamat,
        required this.desa,
    });

    int id;
    String uuid;
    String userNoNik;
    String password;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    String noKk;
    String noNik;
    String namaLengkap;
    String tempatLahir;
    DateTime tanggalLahir;
    String shdk;
    String alamat;
    String desa;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uuid: json["uuid"],
        userNoNik: json["no_nik"],
        password: json["password"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        noKk: json["NO_KK"],
        noNik: json["NO_NIK"],
        namaLengkap: json["NAMA_LENGKAP"],
        tempatLahir: json["TEMPAT_LAHIR"],
        tanggalLahir: DateTime.parse(json["TANGGAL_LAHIR"]),
        shdk: json["SHDK"],
        alamat: json["ALAMAT"],
        desa: json["DESA"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "no_nik": userNoNik,
        "password": password,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "NO_KK": noKk,
        "NO_NIK": noNik,
        "NAMA_LENGKAP": namaLengkap,
        "TEMPAT_LAHIR": tempatLahir,
        "TANGGAL_LAHIR": "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "SHDK": shdk,
        "ALAMAT": alamat,
        "DESA": desa,
    };
}
