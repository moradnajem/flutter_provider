import 'package:flutter/foundation.dart';

class number with ChangeNotifier{
  int _number = 0;
  String _dd ;


  int get getnumber => _number;
  String get getstring => _dd;



  set getnumber(int newnumber){
    _number = newnumber;
    notifyListeners();
  }


  set getstring(String newstring){
    _dd = newstring;
    notifyListeners();
  }

}