import 'package:arcadia_rpg/features/auth/domain/entities/user.dart';

class Auth {
  final String? token;
  final User? user;

  Auth({this.token, this.user});
}
