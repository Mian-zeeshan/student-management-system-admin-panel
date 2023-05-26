import 'package:flutter/foundation.dart';

class CustomerAdminProvider with ChangeNotifier {
  //Decleared varibales
  String? _sectionId;
  String? get sectionId => _sectionId;

  void setSectionId(value) {
    _sectionId = value;

    notifyListeners();
  }

  String? _sectionName;
  String? get sectionName => _sectionName;

  void setSectionName(String? sectionName) {
    _sectionName = sectionName;

    notifyListeners();
  }

  String? _genderId;
  String? get genderId => _genderId;

  void setGenderId(value) {
    _genderId = value;

    notifyListeners();
  }

  String? _genderName;
  String? get genderName => _genderName;

  void setGenderName(String? genderName) {
    _genderName = genderName;

    notifyListeners();
  }

  String? _classId;
  String? get classId => _classId;

  void setclassId(value) {
    _classId = value;

    notifyListeners();
  }

  String? _className;
  String? get className => _className;

  void setClassName(value) {
    _className = value;

    notifyListeners();
  }

   String? _UserUUId;
  String? get UserUUId => _UserUUId;

  void setUserUUId(value) {
    _UserUUId = value;

    notifyListeners();
  }

}
