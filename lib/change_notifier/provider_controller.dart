import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = '';
  String imgAvatar =
      'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png';
  String birthDate = '22/03/1993';

  void alterarDados() {
    name = 'Italo Ramon';
    imgAvatar =
        'https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png';
    birthDate = '08/11/2005';
    notifyListeners();
  }

  void alterarNome() {
    name = 'Academia do flutter';
    imgAvatar =
        'https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png';
    birthDate = '08/11/2005';
    notifyListeners();
  }
}
