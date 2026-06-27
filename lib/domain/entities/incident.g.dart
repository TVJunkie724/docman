// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Incident _$IncidentFromJson(Map<String, dynamic> json) => _Incident(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  ownerProfileId: json['ownerProfileId'] as String,
  type: $enumDecode(_$IncidentTypeEnumMap, json['type']),
  status: $enumDecode(_$IncidentStatusEnumMap, json['status']),
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  linkedIncidentIds:
      (json['linkedIncidentIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  created: DateTime.parse(json['created'] as String),
  updated: DateTime.parse(json['updated'] as String),
  workflowType: json['workflowType'] as String,
  metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$IncidentToJson(_Incident instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'ownerProfileId': instance.ownerProfileId,
  'type': _$IncidentTypeEnumMap[instance.type]!,
  'status': _$IncidentStatusEnumMap[instance.status]!,
  'tags': instance.tags,
  'linkedIncidentIds': instance.linkedIncidentIds,
  'created': instance.created.toIso8601String(),
  'updated': instance.updated.toIso8601String(),
  'workflowType': instance.workflowType,
  'metadata': instance.metadata,
};

const _$IncidentTypeEnumMap = {
  IncidentType.medical: 'medical',
  IncidentType.invoice: 'invoice',
  IncidentType.order: 'order',
  IncidentType.insurance: 'insurance',
  IncidentType.education: 'education',
  IncidentType.trip: 'trip',
  IncidentType.general: 'general',
  IncidentType.personal: 'personal',
};

const _$IncidentStatusEnumMap = {
  IncidentStatus.draft: 'draft',
  IncidentStatus.open: 'open',
  IncidentStatus.ordered: 'ordered',
  IncidentStatus.shipped: 'shipped',
  IncidentStatus.delivered: 'delivered',
  IncidentStatus.warrantyActive: 'warrantyActive',
  IncidentStatus.reclamation: 'reclamation',
  IncidentStatus.quote: 'quote',
  IncidentStatus.cancelled: 'cancelled',
  IncidentStatus.readyForReturn: 'readyForReturn',
  IncidentStatus.booked: 'booked',
  IncidentStatus.duringTrip: 'duringTrip',
  IncidentStatus.scheduled: 'scheduled',
  IncidentStatus.attended: 'attended',
  IncidentStatus.paymentDue: 'paymentDue',
  IncidentStatus.paid: 'paid',
  IncidentStatus.submittedPublic: 'submittedPublic',
  IncidentStatus.reviewRequired: 'reviewRequired',
  IncidentStatus.submittedPrivate: 'submittedPrivate',
  IncidentStatus.actionRequired: 'actionRequired',
  IncidentStatus.closed: 'closed',
  IncidentStatus.archived: 'archived',
};
