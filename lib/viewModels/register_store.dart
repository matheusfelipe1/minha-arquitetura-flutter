import 'package:archteture/repositories/contracts/iregister_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/user_model.dart';
import '../providers/data/data_provider.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  late final IRegisterRepository _iRegisterRepository;

  _RegisterStoreBase(this._iRegisterRepository);

  final _userModel = UserModel();
  final provider = Provider();


  @computed
  User get user => _userModel.user;

  @observable
  bool loadingImage = false;

  @observable
  bool loading = false;

  @action
  getImage(String name, String email) async {
    loadingImage = true;
    final path = await _userModel.getImage(user);
    provider.setUser = User(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: name,
        path: path,
        email: email);
    loadingImage = false;
  }

  @action
  register() async {
    loading = true;
    await _iRegisterRepository.register(user.toJson());
    loading = false;
    Modular.to.pop();
    provider.newUser = user;
  }
}
