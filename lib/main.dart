import 'package:flutter/material.dart';
import 'package:singleton/pages/pagina1_page.dart';
import 'package:singleton/pages/pagina2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (context) => const Pagina1Page(),
        'pagina2': (context) => const Pagina2Page(),
      },
    );
  }
}