import 'package:equatable/equatable.dart';

class RequestModel extends Equatable {
  String name;
  String email;
  String password;
  String rePassword;
  String phone;

  RequestModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.rePassword,
      required this.phone});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, phone, password];
}
