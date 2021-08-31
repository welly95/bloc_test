import 'package:equatable/equatable.dart';

abstract class UserEvents extends Equatable {
  const UserEvents();
}

class GetUserList extends UserEvents {
  @override
  List<Object> get props => [];
}
