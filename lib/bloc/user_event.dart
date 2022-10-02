part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.load() = UserEventLoad;
  const factory UserEvent.clear() = UserEventClear;
}
