// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStoreBase, Store {
  Computed<User>? _$userComputed;

  @override
  User get user => (_$userComputed ??=
          Computed<User>(() => super.user, name: '_RegisterStoreBase.user'))
      .value;

  late final _$loadingImageAtom =
      Atom(name: '_RegisterStoreBase.loadingImage', context: context);

  @override
  bool get loadingImage {
    _$loadingImageAtom.reportRead();
    return super.loadingImage;
  }

  @override
  set loadingImage(bool value) {
    _$loadingImageAtom.reportWrite(value, super.loadingImage, () {
      super.loadingImage = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_RegisterStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$getImageAsyncAction =
      AsyncAction('_RegisterStoreBase.getImage', context: context);

  @override
  Future getImage(String name, String email) {
    return _$getImageAsyncAction.run(() => super.getImage(name, email));
  }

  late final _$registerAsyncAction =
      AsyncAction('_RegisterStoreBase.register', context: context);

  @override
  Future register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  @override
  String toString() {
    return '''
loadingImage: ${loadingImage},
loading: ${loading},
user: ${user}
    ''';
  }
}
