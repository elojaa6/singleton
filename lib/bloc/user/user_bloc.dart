import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      emit(UserSetState(event.usuario));
    });

    on<DeleteUser>((event, emit) {
      emit(const UserInitialState());
    });

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;

      emit(UserSetState(state.usuario!.copyWith(edad: event.age)));
    });

    on<AddProfessionUser>((event, emit) {
      if (!state.existUser) return;

      final newProfessions = [...state.usuario!.profesiones, event.profession];

      emit(UserSetState(state.usuario!.copyWith(profesiones: newProfessions)));
    });
  }
}
