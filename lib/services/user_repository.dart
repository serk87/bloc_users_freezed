import 'package:bloc_network_users/model/user.dart';
import 'package:bloc_network_users/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
