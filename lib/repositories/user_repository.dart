import 'dart:convert';
import '../models/user.dart';

class UserRepository {
  Future<User> fetchUser() async {
    await Future.delayed(Duration(seconds: 2));

    // Dummy user data
    const dummyUserData = '''{
      "id": "123",
      "name": "John Doe",
      "email": "johndoe@example.com"
    }''';

    return User.fromJson(json.decode(dummyUserData));
  }
}
