import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/usuario/usuario_cubit.dart';
import 'package:singleton/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UsuarioCubit>();

    final Usuario user = Usuario(
      nombre: 'Elvis Loja',
      edad: 24,
      profesiones: [
        'Programado',
        'Desarrollador',
      ],
    );
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
                userCubit.seleccionarUsuario(user);
                Navigator.pop(context);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userCubit.cambiarEdad(25);
                Navigator.pop(context);
              },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userCubit.agregarProfesion('Flutter');
                Navigator.pop(context);
              },
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
