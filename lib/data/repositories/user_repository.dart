import 'package:minimart/data/data_sources/local_datasource.dart';
import 'package:minimart/domain/models/user.dart';

final class UserRepository {
  UserRepository(this._dataSource);

  final LocalDataSource _dataSource;
  User? _user;

  Future<User> getUser() async {
    return _user ??= await _dataSource.getUser();
  }

  Future<void> updateDeliveryAddress(String address) async {
    final user = await getUser();
    _user = user..deliveryAddress = address;
  }
}
