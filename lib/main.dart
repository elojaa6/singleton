import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton/pages/pagina1_page.dart';
import 'package:singleton/pages/pagina2_page.dart';
import 'package:singleton/services/usuario_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UsuarioService(),
        ),
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (context) => const Pagina1Page(),
          'pagina2': (context) => const Pagina2Page(),
        },
      ),
    );
  }
}
