import 'package:flutter/foundation.dart';

class RoleProvider with ChangeNotifier {
  //Decleared varibales

  String? _roleListValue;

//Getter of the variables

  String? get roleListValue => _roleListValue;

//setter of the varibales

  void setroleListValue(String val) {
    _roleListValue = val;
    notifyListeners();
  }
}
