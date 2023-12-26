import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_use/firebase_options.dart';
import 'package:provider_use/providers/provider.dart';
import 'package:provider_use/screens/asal_sayi_bulma.dart';
import 'package:provider_use/screens/harf_notu.dart';
import 'package:provider_use/screens/home_screen.dart';
import 'package:provider_use/screens/third_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AsalSayi(),
        ),
        ChangeNotifierProvider(
          create: (context) => HarfNotuSinifi(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Gökbörü Efe Tığrel',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/first': (context) => const AsalSayiEkrani(),
        '/second': (context) => const HarfNotuEkrani(),
        '/third': (context) => const ThirdScreen(),
      },
    );
  }
}
