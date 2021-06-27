import 'package:flutter/material.dart';

class WebPhotoProvider extends ChangeNotifier {
  WebPhotoProvider(this._currentIndex);


  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}
