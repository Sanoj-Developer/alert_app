class UserModel {
  String? uid;
  String? name;
  String? email;
  String? password;
  String? userType;

  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.password,
      required this.userType});
}
