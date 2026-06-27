// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Document _$DocumentFromJson(Map<String, dynamic> json) => _Document(
  id: json['id'] as String,
  incidentId: json['incidentId'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  sender: json['sender'] as String?,
  fileUrl: json['fileUrl'] as String,
  type: $enumDecode(_$DocumentTypeEnumMap, json['type']),
  previousVersionId: json['previousVersionId'] as String?,
  version: (json['version'] as num?)?.toInt() ?? 1,
  incidentStatus: $enumDecodeNullable(
    _$IncidentStatusEnumMap,
    json['incidentStatus'],
  ),
  isDraft: json['isDraft'] as bool? ?? false,
  uploaderProfileId: json['uploaderProfileId'] as String?,
  created: DateTime.parse(json['created'] as String),
  metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$DocumentToJson(_Document instance) => <String, dynamic>{
  'id': instance.id,
  'incidentId': instance.incidentId,
  'title': instance.title,
  'description': instance.description,
  'sender': instance.sender,
  'fileUrl': instance.fileUrl,
  'type': _$DocumentTypeEnumMap[instance.type]!,
  'previousVersionId': instance.previousVersionId,
  'version': instance.version,
  'incidentStatus': _$IncidentStatusEnumMap[instance.incidentStatus],
  'isDraft': instance.isDraft,
  'uploaderProfileId': instance.uploaderProfileId,
  'created': instance.created.toIso8601String(),
  'metadata': instance.metadata,
};

const _$DocumentTypeEnumMap = {
  DocumentType.invoice: 'invoice',
  DocumentType.receipt: 'receipt',
  DocumentType.contract: 'contract',
  DocumentType.report: 'report',
  DocumentType.prescription: 'prescription',
  DocumentType.other: 'other',
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
