import 'package:clean_arc_api/features/user/domain/entities/user_entites.dart';

abstract class UserState {}

class UserinitialState extends UserState {}

class UserlodingState extends UserState {}

class UserSuccessState extends UserState {
  final UserEntity user;

  UserSuccessState({required this.user});
}

class UserErrorState extends UserState {
  final String errorMessage;

  UserErrorState({required this.errorMessage});
}

class UserSliderState extends UserState {}
