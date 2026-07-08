import 'package:authentication_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 0));

    if (email == "email@email.com" && password == "123") {
      final user = UserModel(id: "1", email: email);

      await saveUser(user);
      return user;
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

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("user_id", user.id);

    await prefs.setString("user_email", user.email);
  }

  Future<UserModel?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();

    final id = prefs.getString("user_id");
    final email = prefs.getString("user_email");

    if (id == null || email == null) {
      return null;
    }

    return UserModel(id: id, email: email);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("user_email");
    await prefs.remove("user_id");
  }
}
