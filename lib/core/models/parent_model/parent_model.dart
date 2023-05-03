class ParentModel {
  String? parentId;
  String? name;
  String? phnNo;
  String? adress;
  String? cnicNo;
  String? childId;
  String? email;
  String? password;
  String? createdAt;
  String? createdBy;

  ParentModel({
    this.parentId,
    this.name,
    this.phnNo,
    this.adress,
    this.cnicNo,
    this.childId,
    this.email,
    this.password,
    this.createdAt,
    this.createdBy,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      parentId: json['parentId'],
      name: json['name'],
      phnNo: json['phnNo'],
      adress: json['adress'],
      cnicNo: json['cnicNo'],
      childId: json['childId'],
      email: json['email'],
      password: json['password'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'parentId': parentId,
      'name': name,
      'phnNo': phnNo,
      'adress': adress,
      'cnicNo': cnicNo,
      'childId': childId,
      'email': email,
      'password': password,
      'createdAt': createdAt,
      'createdBy': createdBy,
    };
  }
}
