import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_use/providers/sayac_provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${Provider.of<SayacProvider>(context).sayi}',
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 50),
            OutlinedButton(
              onPressed: () {
                Provider.of<SayacProvider>(context, listen: false).sayiArttir();
              },
              child: const Text('Arttır'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Diğer Sayfa'),
            ),
          ],
        ),
      ),
    );
  }
}
