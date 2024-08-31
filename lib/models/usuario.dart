// ignore_for_file: public_member_api_docs, sort_constructors_first
class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    required this.profesiones,
  });

  Usuario copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) {
    return Usuario(
      nombre: nombre ?? this.nombre,
      edad: edad ?? this.edad,
      profesiones: profesiones ?? this.profesiones,
    );
  }
}
