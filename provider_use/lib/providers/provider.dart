import 'package:flutter/material.dart';
import 'package:provider_use/firestore.dart';

// -------------------------- Asal Sayı İşlemleri --------------------------

class AsalSayi with ChangeNotifier {
  TextEditingController controller = TextEditingController();
  String? mesaj;
  final FirestoreService firestoreService = FirestoreService();

  void asalSayiBul() {
    try {
      int? enteredNumber = int.tryParse(controller.text);

      if (enteredNumber == null) {
        mesaj = 'Geçersiz giriş';
      } else if (enteredNumber == 1 ||
          enteredNumber == 2 ||
          enteredNumber == 3) {
        mesaj = 'Sayı Asaldır';
      } else {
        bool isPrime = true;
        for (int i = 2; i <= enteredNumber / 2; i++) {
          if (enteredNumber % i == 0) {
            isPrime = false;
            break;
          }
        }
        if (isPrime) {
          mesaj = 'Sayı Asaldır';
        } else {
          mesaj = 'Sayı Asal Değildir';
        }

        firestoreService.addUserInput(enteredNumber, mesaj!);
      }

      notifyListeners();
    } catch (e) {
      print('Hata: $e');
    }
  }
}

// -------------------------- Harf Notu İşlemleri --------------------------

class HarfNotuSinifi with ChangeNotifier {
  TextEditingController controllerVize = TextEditingController();
  TextEditingController controllerFinal = TextEditingController();
  final FirestoreServiceHarfNotu firestoreService = FirestoreServiceHarfNotu();

  String? sonuc;

  void harfNotuHesaplamaFonksiyonu() {
    try {
      int? vize_ = int.tryParse(controllerVize.text);
      int? final_ = int.tryParse(controllerFinal.text);

      if (vize_ != null &&
          final_ != null &&
          (vize_ >= 0 && vize_ <= 100) &&
          (final_ >= 0 && final_ <= 100)) {
        double ortalama = vize_ * 0.4 + final_ * 0.6;
        if (ortalama >= 84.5 && ortalama <= 100) {
          sonuc = 'Ortalama : $ortalama  Harf Notu : AA';
        } else if (ortalama >= 69.5 && ortalama < 84.5) {
          sonuc = 'Ortalama : $ortalama  Harf Notu : BB';
        } else if (ortalama >= 59.5 && ortalama < 69.5) {
          sonuc = 'Ortalama : $ortalama  Harf Notu : CC';
        } else if (ortalama >= 49.5 && ortalama < 59.5) {
          sonuc = 'Ortalama : $ortalama  Harf Notu : DD';
        } else {
          sonuc = 'Ortalama : $ortalama  Harf Notu : FF';
        }

        FirestoreServiceHarfNotu firestoreHarfNotuService =
            FirestoreServiceHarfNotu();

        firestoreHarfNotuService.notBilgileriEkle(
            vize_, final_, ortalama, sonuc!);
      } else {
        sonuc = 'Geçersiz giriş. \nNotlar 0 ile 100 arasında olmalıdır.';
      }
    } catch (e) {
      print('Hata: $e');
      sonuc = 'Bir hata oluştu.';
    }

    notifyListeners();
  }
}
