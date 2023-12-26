import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_use/providers/provider.dart';

class HarfNotuEkrani extends StatelessWidget {
  const HarfNotuEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    final harf = Provider.of<HarfNotuSinifi>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: harf.controllerVize,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Vize',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: harf.controllerFinal,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Final',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => harf.harfNotuHesaplamaFonksiyonu(),
              child: const Text('Hesapla'),
            ),
            const SizedBox(height: 20),
            Text(
              harf.sonuc ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
