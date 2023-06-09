class StudentModel {
  String? studentId;
  String? name;
  String? rollNo;
  String? gender;
  String? className;
  String? classSection;
  String? email;
  String? password;
  String? fatherName;
  String? phoneNo;
  String dateOfBirth;
  String? address;
  String? CNIC;
  String? fatherCNIC;
  String? createdAt;
  String? createdBy;

  StudentModel({
    required this.studentId,
    required this.name,
    required this.rollNo,
    required this.gender,
    required this.className,
    required this.classSection,
    required this.email,
    required this.password,
    required this.fatherName,
    required this.phoneNo,
    required this.dateOfBirth,
    required this.address,
    required this.CNIC,
    required this.fatherCNIC,
    required this.createdAt,
    required this.createdBy,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      studentId: json['stdId'],
      name: json['name'],
      rollNo: json['rollNo'],
      gender: json['gender'],
      className: json['className'],
      classSection: json['classSection'],
      email: json['email'],
      password: json['password'],
      fatherName: json['fatherName'],
      phoneNo: json['phoneNo'],
      dateOfBirth: json['dateOfBirth'],
      address: json['address'],
      CNIC: json['CNIC'],
      fatherCNIC: json['fatherCNIC'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stdId': studentId,
      'name': name,
      'rollNo': rollNo,
      'gender': gender,
      'className': className,
      'classSection': classSection,
      'email': email,
      'password': password,
      'fatherName': fatherName,
      'phoneNo': phoneNo,
      'dateOfBirth': dateOfBirth,
      'address': address,
      'CNIC': CNIC,
      'fatherCNIC': fatherCNIC,
      'createdAt': createdAt,
      'createdBy': createdBy,
    };
  }
}
