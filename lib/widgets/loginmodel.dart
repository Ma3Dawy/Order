class LogInModel {
  final String? username, password;
  LogInModel({this.username, this.password});

  factory LogInModel.fromJson(json) =>
      LogInModel(password: json['password'], username: json['phone']);

  static Map<String, dynamic> toMap(
          {required String phone, required String password}) =>
      <String, dynamic>{'phone': phone, 'password': password};

  static toJson({required phone, required password}) {}
}
