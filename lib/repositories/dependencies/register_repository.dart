import 'package:archteture/providers/databases/user_database.dart';
import 'package:archteture/providers/service/datasource.dart';
import 'package:archteture/repositories/contracts/iregister_repository.dart';

class RegisterRepository implements IRegisterRepository {
  final _dataSource = DataSource();
  final database = UserDatabase();
  @override
  Future<void> register(Map<String, dynamic> data) async {
    await database.insertDatas({
      "id": data['id'],
      "name": data['name'],
      "email": data['email'],
    });
    await Future.delayed(const Duration(seconds: 5));

  }
}