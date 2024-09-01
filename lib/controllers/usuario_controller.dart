import 'package:get/get.dart';
import 'package:singleton/models/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  void cargarUsuario(Usuario pUsuario) {
    existeUsuario.value = true;
    usuario.value = pUsuario;
  }

  void cambiarEdad(int edad) {
    if (!existeUsuario.value) return;

    usuario.update(
      (val) {
        val!.edad = edad;
      },
    );
  }

  void agregarProfession(String profesion) {
    if (!existeUsuario.value) return;

    usuario.update(
      (val) {
        val!.profesiones = [...?val.profesiones, profesion];
      },
    );
  }
}
