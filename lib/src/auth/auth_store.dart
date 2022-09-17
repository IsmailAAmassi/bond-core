import 'package:one_studio_core/src/auth/authenticable.dart';

abstract class AuthStore<T extends Authenticable> {
  bool get hasToken => false;

  T? get user => null;

  set user(T? user);

  String? get token => null;

  set token(String? token);

  set verificationAt(DateTime? verificationAt);

  DateTime? get verificationAt => null;

  bool? get isVerify => false;

  Future<void> clearAppData(List<String>? expect);
}
