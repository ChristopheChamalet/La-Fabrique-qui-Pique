import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';
import 'auth_provider.dart';

class UserProvider with ChangeNotifier {
  final String host = 'http://10.0.2.2';
  late User? user;
  late AuthProvider authProvider;

  update(AuthProvider newAuthProvider) {
    authProvider = newAuthProvider;
    if (authProvider.isLoggedin == true) {
      fetchCurrentUser();
    }
  }

  Future<void> fetchCurrentUser() async {
    http.Response response = await http.get(
      Uri.parse('$host/api/user/current-user'),
      headers: {'authorization': 'Bearer ${authProvider.token}'},
    );
    if (response.statusCode == 200) {
      updateUser(
        User.fromJson(
          json.decode(response.body),
        ),
      );
    }
  }

  void updateUser(User updatedUser) {
    user = updatedUser;
    notifyListeners();
  }
}