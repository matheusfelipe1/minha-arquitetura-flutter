import '../../models/user_model.dart';

abstract class IHomeRepository {
  Future<List<User>> getAll();
}