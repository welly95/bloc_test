import 'package:bloc_test/blocs/users/user_events.dart';
import 'package:bloc_test/blocs/users/user_states.dart';
import 'package:bloc_test/repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  final UserRepo _userRepo = UserRepo();

  UserBloc(UserStates initialState) : super(initialState);

  @override
  Stream<UserStates> mapEventToState(
    UserEvents event,
  ) async* {
    if (event is GetUserList) {
      try {
        yield UserLoadingState();
        final mList = await _userRepo.fetchData();
        yield UserSuccessState(mList);
        if (mList.error != null) {
          yield UserErrorState('Error');
        }
      } on NetworkError {
        yield UserErrorState("Failed to fetch data. is your device online?");
      }
    }
  }
}
