import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String? _userName;
  String? _userPictureURL;

  String? get userName => _userName;

  set userNanme(String? value) {
    _userName = value;
    notifyListeners();
  }

  //TODO remove this when doing login function

  String? get userPictureURL =>
      'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg'; //_userPictureURL;

  set userPictureURL(String? value) {
    _userPictureURL = value;
    notifyListeners();
  }
}
