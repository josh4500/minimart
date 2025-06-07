import 'package:flutter/foundation.dart';
import 'package:minimart/domain.dart';
import 'package:minimart/generated/l10n.dart' show S;

import 'error_handling.dart';

class UserProvider with ChangeNotifier, ErrorHandling {
  UserProvider({required GetUserUseCase getUser}) : _getUser = getUser;
  final GetUserUseCase _getUser;

  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get deliveryAddress => _user?.deliveryAddress;

  Future<void> loadUser() async {
    _isLoading = true;
    clearError(false);

    try {
      _user = await _getUser.invoke();
    } catch (e) {
      setError(S.current.failedToLoadUserData);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateDeliveryAddress(String newAddress) async {
    if (_user == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      _user!.deliveryAddress = newAddress;
    } catch (e) {
      setError(S.current.failedToUpdateAddress);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
