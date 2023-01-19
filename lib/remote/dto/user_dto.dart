import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO {
  factory UserDTO({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'mobile_number') int? mobileNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'job_preference') String? jobPreference,
}) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}

/*Model Without Key Pair Value*/

/*  @freezed
  class UserDTO with _$UserDTO {
    factory UserDTO({
    required int id,
    required int userId,
    required String name,
    required int mobileNumber,
    required String email,
    required String gender,
    required String jobPreference,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, Object?> json)
  => _$UserDTOFromJson(json);
}*/