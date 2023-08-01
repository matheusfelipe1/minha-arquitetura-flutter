import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:archteture/shared/constants/extensions.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? email;
  String? name;
  String? path;

  User({this.email, this.id, this.name, this.path});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class UserModel {
  final atom = Atom();
  static final UserModel _instance = UserModel._();
  UserModel._();
  factory UserModel() => UserModel._instance;

  @observable
  User _user = User();

  @observable
  List<User> _users = [];

  @observable
  List<User> _usersCached = [];

  User get user {
    atom.reportObserved();
    return _user;
  }

  set setUser(User user) {
    _user = user;
    atom.reportChanged();
  }

  List<User> get users {
    atom.reportObserved();
    return _users;
  }

  set setUsers(List<User> users) =>
      {_users = users, _usersCached = users, atom.reportChanged()};

  filter(String query) {
    final list = _usersCached
        .where((element) =>
            element.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();
    atom.reportChanged();
    _users = list;
  }

  Future<String> getImage(User user) async {
    return await ImagePicker().getPath(ImageSource.camera) ?? "";
  }
}
