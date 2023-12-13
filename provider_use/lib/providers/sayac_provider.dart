import 'package:flutter/material.dart';

class SayacProvider with ChangeNotifier {
  int sayi = 0;

  void sayiArttir() {
    sayi++;
    notifyListeners();
  }
}
