import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  @JsonKey(name: 'auth_token')
  String authToken;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'phone')
  String? phone;

  LoginData({
    required this.authToken,
    this.email,
    this.name,
    this.phone,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
