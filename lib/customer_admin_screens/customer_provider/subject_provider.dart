import 'package:flutter/foundation.dart';

class SubjectProvider with ChangeNotifier {
  String? _subjectName;
  String? _subjectId;
  String? get subjectName => _subjectName;

  void setSubjectName(String? value) {
    _subjectName = value;
    notifyListeners();
  }

  String? get subjectId => _subjectId;

  void setSubjectId(String? value) {
    _subjectId = value;
    notifyListeners();
  }
}
