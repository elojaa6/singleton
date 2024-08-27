import 'package:flutter/material.dart';
import 'package:singleton/models/usuario.dart';
import 'package:singleton/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStrem,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Text(usuarioService.usuario.nombre)
                : const Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final nuevoUsuario = Usuario(
                  nombre: 'Elvis',
                  edad: 24,
                  profesiones: ['Programador', 'Ingeniero'],
                );
                usuarioService.cargarUsuario(nuevoUsuario);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(25);
              },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
