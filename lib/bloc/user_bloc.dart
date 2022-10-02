import 'package:bloc_network_users/services/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_network_users/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(const UserState.empty()) {
    on<UserEvent>((event, emit) async {
      if (event is UserEventLoad) {
        emit(const UserState.loading());
        try {
          final List<User> loadedUserList = await userRepository.getAllUsers();
          emit(UserState.loaded(userLoaded: loadedUserList));
        } catch (e) {
          emit(const UserState.error());
        }
      } else {
        emit(const UserState.empty());
      }
    });
  }
}
