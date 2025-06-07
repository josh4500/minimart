import 'package:minimart/data/repositories/user_repository.dart';
import 'package:minimart/domain/models/user.dart';

final class GetUserUseCase {
  GetUserUseCase(this._repository);
  final UserRepository _repository;
  Future<User> invoke() => _repository.getUser();
}
