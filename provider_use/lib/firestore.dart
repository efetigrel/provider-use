import 'package:cloud_firestore/cloud_firestore.dart';

// -------------------------- Asal Sayı Veritabanı İşlemleri --------------------------

class FirestoreService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserInput(int enteredNumber, String message) async {
    try {
      await usersCollection.add(
        {
          'enteredNumber': enteredNumber,
          'message': message,
        },
      );
    } catch (e) {
      print('Hata: $e');
    }
  }
}

// -------------------------- Harf Notu Veritabanı İşlemleri --------------------------

class FirestoreServiceHarfNotu {
  final CollectionReference harfNotuCollection =
      FirebaseFirestore.instance.collection('harfnotu');

  Future<void> notBilgileriEkle(
      int vize_, int final_, double ortalama, String sonuc) async {
    try {
      await harfNotuCollection.add(
        {
          'vize': vize_,
          'final': final_,
          'ortalama': ortalama,
          'Harf Noto': sonuc,
        },
      );
    } catch (e) {
      print('Hata: $e');
    }
  }
}
