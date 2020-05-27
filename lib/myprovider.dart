import 'package:flutter/foundation.dart';

class number with ChangeNotifier{
  int _number = 0;
  int get getnumber => _number;
  set getnumber(int newnumber){
    _number = newnumber;
    notifyListeners();
  }
}