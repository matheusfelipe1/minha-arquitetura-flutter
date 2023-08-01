import 'package:archteture/repositories/contracts/ihome_repository.dart';
import 'package:mobx/mobx.dart';

import '../models/user_model.dart';
import '../providers/data/data_provider.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  late final IHomeRepository _homeRepository;

  final _userModel = UserModel();
  final provider = Provider();

  @computed
  User get user => _userModel.user;

  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  bool initSearch = false;
  
  _HomeStoreBase(this._homeRepository) {
    _init();
  }

  @action
  _init() async {
    autorun((_) {
      if (users.length != _userModel.users.length) {
        final list = ObservableList<User>();
        list.addAll(_userModel.users);
        users = list;
      }
    });
    provider.setUsers = await _homeRepository.getAll();
    users.addAll(_userModel.users);
    
  }



  @action
  filter(String query) {
    _userModel.filter(query);
  }

  @action
  tapSearc() {
    initSearch = !initSearch;
  }



}