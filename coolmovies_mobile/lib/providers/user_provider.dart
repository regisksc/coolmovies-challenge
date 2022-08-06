import 'package:flutter/material.dart';

import '../core/core.dart';
import '../repositories/repositories.dart';

class UserProvider extends ChangeNotifier {
  UserProvider(UserRepository repository) : _repository = repository;

  //
  UserModel? _user;

  UserModel? get user => _user;

  final UserRepository _repository;

  Failure? lastRequestFailure;

  Future getCurrentUser() async {
    lastRequestFailure = null;
    final user = await _repository.getCurrentUser();
    user.fold(
      (failure) => lastRequestFailure = failure,
      (user) => _user = user,
    );
    notifyListeners();
  }
}
