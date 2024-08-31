// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'usuario_cubit.dart';

abstract class UsuarioState {}

@immutable
class UsuarioInitial extends UsuarioState {
  final existeUsario = false;
}

class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo({
    required this.usuario,
  });
}
