// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<User>? _$userComputed;

  @override
  User get user => (_$userComputed ??=
          Computed<User>(() => super.user, name: '_HomeStoreBase.user'))
      .value;

  late final _$usersAtom = Atom(name: '_HomeStoreBase.users', context: context);

  @override
  ObservableList<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$initSearchAtom =
      Atom(name: '_HomeStoreBase.initSearch', context: context);

  @override
  bool get initSearch {
    _$initSearchAtom.reportRead();
    return super.initSearch;
  }

  @override
  set initSearch(bool value) {
    _$initSearchAtom.reportWrite(value, super.initSearch, () {
      super.initSearch = value;
    });
  }

  late final _$_initAsyncAction =
      AsyncAction('_HomeStoreBase._init', context: context);

  @override
  Future _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  dynamic filter(String query) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.filter');
    try {
      return super.filter(query);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic tapSearc() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.tapSearc');
    try {
      return super.tapSearc();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
initSearch: ${initSearch},
user: ${user}
    ''';
  }
}
