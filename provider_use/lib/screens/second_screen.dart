import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_use/providers/sayac_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${Provider.of<SayacProvider>(context).sayi}',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.amber,
              ),
            ),
            // Consumer<SayacProvider>(
            //   builder: (context, value, child) {
            //     return Column(
            //       children: [
            //         Text(
            //           value.sayi.toString(),
            //           style: const TextStyle(
            //             fontSize: 50,
            //             color: Colors.amber,
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ),
            const SizedBox(height: 50),
            IconButton(
              onPressed: () =>
                  Provider.of<SayacProvider>(context, listen: false)
                      .sayiArttir(),
              icon: const Icon(Icons.add),
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
