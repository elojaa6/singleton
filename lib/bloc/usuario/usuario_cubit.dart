import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(usuario: user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(usuario: newUser));
    }
  }

  void agregarProfesion(String profesion) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newProfesion = currentState.usuario.profesiones;
      newProfesion.add(profesion);
      final newUser = currentState.usuario.copyWith(profesiones: newProfesion);
      emit(UsuarioActivo(usuario: newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
