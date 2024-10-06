// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      authToken: json['auth_token'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'auth_token': instance.authToken,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
    };
