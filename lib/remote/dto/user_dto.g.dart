// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDTO _$$_UserDTOFromJson(Map<String, dynamic> json) => _$_UserDTO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      mobileNumber: json['mobile_number'] as int?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      jobPreference: json['job_preference'] as String?,
    );

Map<String, dynamic> _$$_UserDTOToJson(_$_UserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobile_number': instance.mobileNumber,
      'email': instance.email,
      'gender': instance.gender,
      'job_preference': instance.jobPreference,
    };
