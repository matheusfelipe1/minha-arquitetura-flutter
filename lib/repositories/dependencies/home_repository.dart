import 'package:archteture/models/user_model.dart';
import 'package:archteture/providers/service/datasource.dart';
import 'package:archteture/repositories/contracts/ihome_repository.dart';
import 'package:flutter/material.dart';

class HomeRepository implements IHomeRepository {
  final _dataSource = DataSource();
  @override
  Future<List<User>> getAll() async {
    try {
      final List<Map<String, dynamic>> data = await _dataSource.get("get", null);
      return data.map(User.fromJson).toList();
      
    } catch (e) {
      debugPrint(e.toString());
      final datas = array.cast<Map<String, dynamic>>();
      return datas.map(User.fromJson).toList();
    }
  }

















  // exemplo: APENAS PARA RETORNAR ALGUMA COISA

  static List get array => [
    {
      "id": "iagfoiiwhufhwi0chndfdf",
      "name": "Matheus",
      "email": "matheus@gmail.com"
    },
    {
      "id": "iagfoiiwhufhwi0cahnkkkkk",
      "name": "João Souza",
      "email": "joao@gmail.com"
    },
    {
      "id": "iagfoiiwhufhwi0achnidhvhi",
      "name": "Elton",
      "email": "elton@gmail.com"
    },
  ];
}