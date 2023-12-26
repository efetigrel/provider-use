import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_use/providers/provider.dart';

class AsalSayiEkrani extends StatelessWidget {
  const AsalSayiEkrani({Key? key});

  @override
  Widget build(BuildContext context) {
    final asal = Provider.of<AsalSayi>(context);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: asal.controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Sayi Gir',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  asal.asalSayiBul();
                },
                child: const Text('Kontrol Et'),
              ),
              const SizedBox(height: 20),
              Text(
                asal.mesaj ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
