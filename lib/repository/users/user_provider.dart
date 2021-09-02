import 'package:dio/dio.dart';
import 'package:bloc_test/models/user_model.dart';

class UserProvider {
  final Dio _dio = Dio();
  String _url = 'https://reqres.in/api/users/';

  Future<UserModel> fetchData() async {
    try {
      Response response = await _dio.get(_url);
      return UserModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserModel.withError("Data not found / Connection issue");
    }
  }
}
