import 'package:bloc_test/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserStates extends Equatable {
  const UserStates();
}

class UserInitState extends UserStates {
  const UserInitState();
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserStates {
  const UserLoadingState();
  @override
  List<Object?> get props => [];
}

class UserSuccessState extends UserStates {
  final UserModel? userModel;
  const UserSuccessState(this.userModel);

  List<Object?> get props => [userModel];
}

class UserErrorState extends UserStates {
  final String? msg;
  UserErrorState(this.msg);

  @override
  List<Object?> get props => [msg];
}
