import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton/controllers/usuario_controller.dart';
import 'package:singleton/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Obx(
        () => usuarioCtrl.existeUsuario.value
            ? InformationUsuario(usuario: usuarioCtrl.usuario.value)
            : const NoInfo(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Get.toNamed('pagina2'),
        //Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay usuario seleccionado'),
    );
  }
}

class InformationUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformationUsuario({
    super.key,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...usuario.profesiones!.map((e) => ListTile(
                title: Text(e),
              )),
        ],
      ),
    );
  }
}
