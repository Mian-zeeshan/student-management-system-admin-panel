import 'package:flutter/material.dart';

class PageIndexProvider with ChangeNotifier {
  //Todo:this function use changing the index for pages



  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  void setPageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

}
