part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final Usuario? usuario;

  const UserState({
    this.existUser = false,
    this.usuario,
  });
}

class UserInitialState extends UserState {
  const UserInitialState() : super(existUser: false, usuario: null);
}

class UserSetState extends UserState {
  final Usuario newUser;
  const UserSetState(this.newUser) : super(existUser: true, usuario: newUser);
}
