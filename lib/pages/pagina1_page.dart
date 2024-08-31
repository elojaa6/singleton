import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/usuario/usuario_cubit.dart';
import 'package:singleton/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => userCubit.borrarUsuario(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (UsuarioInitial):
            return const Center(child: Text('No hay informacion del usuario'));
          case const (UsuarioActivo):
            return InformationUsuario(
                usuario: (state as UsuarioActivo).usuario);
          default:
            return const Center(child: Text('Estado no reconocido'));
        }

        // if (state is UsuarioInitial) {
        // return const Center(child: Text('No hay informacion del usuario'));
        // } else if (state is UsuarioActivo) {
        // return InformationUsuario(usuario: state.usuario);
        // } else {
        // return const Center(child: Text('Estado no reconocido'));
        // }
      },
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
