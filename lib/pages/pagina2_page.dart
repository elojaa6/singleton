import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton/controllers/usuario_controller.dart';
import 'package:singleton/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = Usuario(
                  nombre: 'Elvis Loja',
                  edad: 24,
                  profesiones: ['Programador'],
                );
                usuarioCtrl.cargarUsuario(newUser);
                Get.snackbar('Usuario Cargado', '${newUser.nombre}');
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(25);
              },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.agregarProfession('Flutter Developer');
              },
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: const Text(
                'Cambiar Tema',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
