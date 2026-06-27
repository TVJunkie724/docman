enum MockUploadStatus { queued, uploading, uploaded, failed }

enum MockInboxSection { open, attention, recent }

class MockUploadItem {
  const MockUploadItem({
    required this.id,
    required this.title,
    required this.source,
    required this.createdLabel,
    required this.status,
    this.caseId,
    this.failureReason,
  });

  final String id;
  final String title;
  final String source;
  final String createdLabel;
  final MockUploadStatus status;
  final String? caseId;
  final String? failureReason;

  bool get isDraft => status == MockUploadStatus.uploaded && caseId == null;
  bool get isAssigned => caseId != null;

  MockUploadItem copyWith({
    String? id,
    String? title,
    String? source,
    String? createdLabel,
    MockUploadStatus? status,
    String? caseId,
    String? failureReason,
    bool clearFailureReason = false,
    bool clearCaseId = false,
  }) {
    return MockUploadItem(
      id: id ?? this.id,
      title: title ?? this.title,
      source: source ?? this.source,
      createdLabel: createdLabel ?? this.createdLabel,
      status: status ?? this.status,
      caseId: clearCaseId ? null : caseId ?? this.caseId,
      failureReason: clearFailureReason
          ? null
          : failureReason ?? this.failureReason,
    );
  }
}

class MockCaseItem {
  const MockCaseItem({
    required this.id,
    required this.title,
    required this.subtitle,
  });

  final String id;
  final String title;
  final String subtitle;
}

class MobileCaptureInboxMockState {
  const MobileCaptureInboxMockState({
    required this.uploads,
    required this.cases,
    required this.selectedUploadId,
    required this.selectedSection,
    required this.isOffline,
    required this.failNextUpload,
    this.lastActionLabel,
  });

  final List<MockUploadItem> uploads;
  final List<MockCaseItem> cases;
  final String? selectedUploadId;
  final MockInboxSection selectedSection;
  final bool isOffline;
  final bool failNextUpload;
  final String? lastActionLabel;

  MockUploadItem? get selectedUpload {
    for (final upload in uploads) {
      if (upload.id == selectedUploadId) {
        return upload;
      }
    }
    return uploads.isEmpty ? null : uploads.first;
  }

  int get queuedCount => uploads
      .where(
        (upload) =>
            upload.status == MockUploadStatus.queued ||
            upload.status == MockUploadStatus.uploading,
      )
      .length;

  int get draftCount => uploads.where((upload) => upload.isDraft).length;

  int get attentionCount => uploads
      .where(
        (upload) =>
            upload.status == MockUploadStatus.failed ||
            upload.status == MockUploadStatus.queued,
      )
      .length;

  int get assignedCount => uploads.where((upload) => upload.isAssigned).length;

  MobileCaptureInboxMockState copyWith({
    List<MockUploadItem>? uploads,
    List<MockCaseItem>? cases,
    String? selectedUploadId,
    MockInboxSection? selectedSection,
    bool? isOffline,
    bool? failNextUpload,
    String? lastActionLabel,
    bool clearLastAction = false,
  }) {
    return MobileCaptureInboxMockState(
      uploads: uploads ?? this.uploads,
      cases: cases ?? this.cases,
      selectedUploadId: selectedUploadId ?? this.selectedUploadId,
      selectedSection: selectedSection ?? this.selectedSection,
      isOffline: isOffline ?? this.isOffline,
      failNextUpload: failNextUpload ?? this.failNextUpload,
      lastActionLabel: clearLastAction
          ? null
          : lastActionLabel ?? this.lastActionLabel,
    );
  }
}
