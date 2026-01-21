// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      linkedUserId: json['linkedUserId'] as String?,
      managers: (json['managers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      passportNumber: json['passportNumber'] as String?,
      socialSecurityNumber: json['socialSecurityNumber'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'linkedUserId': instance.linkedUserId,
      'managers': instance.managers,
      'passportNumber': instance.passportNumber,
      'socialSecurityNumber': instance.socialSecurityNumber,
      'metadata': instance.metadata,
    };
