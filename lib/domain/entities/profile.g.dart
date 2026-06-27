// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  id: json['id'] as String,
  name: json['name'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  linkedUserId: json['linkedUserId'] as String?,
  managers:
      (json['managers'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  passportNumber: json['passportNumber'] as String?,
  socialSecurityNumber: json['socialSecurityNumber'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatarUrl': instance.avatarUrl,
  'linkedUserId': instance.linkedUserId,
  'managers': instance.managers,
  'passportNumber': instance.passportNumber,
  'socialSecurityNumber': instance.socialSecurityNumber,
  'metadata': instance.metadata,
};
