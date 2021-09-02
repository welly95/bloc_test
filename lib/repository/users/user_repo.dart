import 'package:bloc_test/models/user_model.dart';
import 'package:bloc_test/repository/users/user_provider.dart';

class UserRepo {
  final _provider = UserProvider();
  Future<UserModel> fetchData() {
    return _provider.fetchData();
  }
}

class NetworkError extends Error {}
