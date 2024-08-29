import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton/models/usuario.dart';
import 'package:singleton/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () {
              usuarioService.removerUsuario();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformationUsuario(usuario: usuarioService.usuario)
          : const Center(
              child: Text('No hay usuario seleccionado'),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
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
          ...usuario.profesiones.map((e) => ListTile(
                title: Text(e),
              )),
        ],
      ),
    );
  }
}
