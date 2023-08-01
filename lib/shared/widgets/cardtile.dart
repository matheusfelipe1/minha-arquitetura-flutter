import 'package:archteture/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../viewModels/home_store.dart';

class CardTile extends StatelessWidget {
  final User data;
  final HomeStore controller;
  const CardTile({super.key, required this.data, required this.controller});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.name ?? ''),
      subtitle: Text(data.email ?? ''),
    );
  }
}
