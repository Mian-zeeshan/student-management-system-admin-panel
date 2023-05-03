class StudentModel{
String? stdId;
String? name;
String? rollNo;
String? gender;
String? className;
String? classSection;
String? email;
String? password;
String? createdAt;
String? createdBy;

  StudentModel({
   required this.stdId,
   required this.name,
   required this.rollNo,
   required this.gender, 
   required this.className,
   required this.classSection,
  required  this.email,
  required  this.password,
   required this.createdAt,
   required this.createdBy,
  });

    factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      stdId: json['stdId'],
      name: json['name'],
      rollNo: json['rollNo'],
      gender: json['gender'],
      className: json['className'],
      classSection: json['classSection'],
      email: json['email'],
      password: json['password'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'stdId': stdId,
      'name': name,
      'rollNo': rollNo,
      'gender': gender,
      'className': className,
      'classSection': classSection,
      'email': email,
      'password': password,
      'createdAt': createdAt,
      'createdBy': createdBy,
    };
  }
}



