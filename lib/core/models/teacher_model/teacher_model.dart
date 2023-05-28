class TeacherModel {
  String? teacherId;
  String? name;
  String? phnNo;
  String? adress;
  String? cnicNo;

  String? email;
  String? genderId;
  String? password;
  String? createdAt;
  String? createdBy;

  TeacherModel({
    this.teacherId,
    this.name,
    this.phnNo,
    this.adress,
    this.cnicNo,
    this.email,
    this.genderId,
    this.password,
    this.createdAt,
    this.createdBy,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      teacherId: json['teacherId'],
      name: json['name'],
      phnNo: json['phnNo'],
      adress: json['adress'],
      cnicNo: json['cnicNo'],
      email: json['email'],
      genderId: json['genderId'],
      password: json['password'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teacherId': teacherId,
      'name': name,
      'phnNo': phnNo,
      'adress': adress,
      'cnicNo': cnicNo,
      'email': email,
      'genderId': genderId,
      'password': password,
      'createdAt': createdAt,
      'createdBy': createdBy,
    };
  }
}
