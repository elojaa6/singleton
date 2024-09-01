part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final Usuario usuario;
  ActivateUser(this.usuario);
}

class ChangeUserAge extends UserEvent {
  final int age;
  ChangeUserAge(this.age);
}

class AddProfessionUser extends UserEvent {
  final String profession;
  AddProfessionUser(this.profession);
}

class DeleteUser extends UserEvent{}
