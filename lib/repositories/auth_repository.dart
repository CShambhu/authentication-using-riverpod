import 'package:authentication_app/models/user_model.dart';

class AuthRepository {
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == "email@test.com" && password == "123") {
      return UserModel(id: "1", email: email);
    }
    throw Exception("invalid email and password");
  }

  Future<UserModel> register(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
    );
  }

  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
