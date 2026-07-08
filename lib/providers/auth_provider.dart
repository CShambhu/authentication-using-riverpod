import 'package:authentication_app/models/user_model.dart';
import 'package:authentication_app/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  late final AuthRepository _repository;
  @override
  Future<UserModel?> build() async {
    _repository = AuthRepository();
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    try {
      final user = await _repository.login(email, password);

      state = AsyncData(user);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> register(String email, String password) async {
    state = const AsyncLoading();

    try {
      final user = await _repository.register(email, password);

      state = AsyncData(user);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();

    try {
      await _repository.logout();

      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
