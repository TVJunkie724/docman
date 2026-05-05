import 'package:flutter/foundation.dart';

import 'mock_01_state.dart';

class MobileCaptureInboxMockController
    extends ValueNotifier<MobileCaptureInboxMockState> {
  MobileCaptureInboxMockController()
    : super(
        MobileCaptureInboxMockState(
          uploads: _initialUploads,
          cases: _cases,
          selectedUploadId: _initialUploads.first.id,
          isOffline: false,
          failNextUpload: false,
        ),
      );

  int _nextUploadNumber = 4;

  void addSyntheticCapture() {
    final id = 'upload-$_nextUploadNumber';
    final uploadNumber = _nextUploadNumber;
    _nextUploadNumber += 1;

    final newUpload = MockUploadItem(
      id: id,
      title: 'Neuer Scan $uploadNumber',
      source: 'iPhone Capture',
      createdLabel: 'gerade eben',
      status: value.isOffline
          ? MockUploadStatus.queued
          : MockUploadStatus.uploading,
    );

    value = value.copyWith(
      uploads: [newUpload, ...value.uploads],
      selectedUploadId: id,
      failNextUpload: value.failNextUpload,
    );

    if (!value.isOffline) {
      completeUpload(id);
    }
  }

  void completeUpload(String uploadId) {
    final shouldFail = value.failNextUpload;

    value = value.copyWith(
      uploads: value.uploads.map((upload) {
        if (upload.id != uploadId) {
          return upload;
        }

        if (shouldFail) {
          return upload.copyWith(
            status: MockUploadStatus.failed,
            failureReason: 'Home Hub nicht erreichbar',
          );
        }

        return upload.copyWith(
          status: MockUploadStatus.uploaded,
          clearFailureReason: true,
        );
      }).toList(),
      failNextUpload: false,
    );
  }

  void retryUpload(String uploadId) {
    if (value.isOffline) {
      value = value.copyWith(
        uploads: value.uploads.map((upload) {
          if (upload.id != uploadId) {
            return upload;
          }
          return upload.copyWith(
            status: MockUploadStatus.queued,
            failureReason: 'Wartet auf Verbindung',
          );
        }).toList(),
      );
      return;
    }

    value = value.copyWith(
      uploads: value.uploads.map((upload) {
        if (upload.id != uploadId) {
          return upload;
        }
        return upload.copyWith(
          status: MockUploadStatus.uploading,
          clearFailureReason: true,
        );
      }).toList(),
    );
    completeUpload(uploadId);
  }

  void assignSelectedUpload(String caseId) {
    final selected = value.selectedUpload;
    if (selected == null) {
      return;
    }

    value = value.copyWith(
      uploads: value.uploads.map((upload) {
        if (upload.id != selected.id) {
          return upload;
        }
        return upload.copyWith(
          status: MockUploadStatus.uploaded,
          caseId: caseId,
          clearFailureReason: true,
        );
      }).toList(),
    );
  }

  void selectUpload(String uploadId) {
    value = value.copyWith(selectedUploadId: uploadId);
  }

  void toggleOffline() {
    final nextOffline = !value.isOffline;
    value = value.copyWith(isOffline: nextOffline);

    if (!nextOffline) {
      final queuedUploads = value.uploads
          .where((upload) => upload.status == MockUploadStatus.queued)
          .map((upload) => upload.id)
          .toList();
      for (final uploadId in queuedUploads) {
        retryUpload(uploadId);
      }
    }
  }

  void toggleFailNextUpload() {
    value = value.copyWith(failNextUpload: !value.failNextUpload);
  }

  void reset() {
    _nextUploadNumber = 4;
    value = MobileCaptureInboxMockState(
      uploads: _initialUploads,
      cases: _cases,
      selectedUploadId: _initialUploads.first.id,
      isOffline: false,
      failNextUpload: false,
    );
  }
}

const _cases = [
  MockCaseItem(
    id: 'case-health-2026',
    title: 'Gesundheit 2026',
    subtitle: 'Arzt, Labor, Rezepte',
  ),
  MockCaseItem(
    id: 'case-apartment',
    title: 'Wohnung',
    subtitle: 'Miete, Versicherung, Reparaturen',
  ),
  MockCaseItem(
    id: 'case-travel',
    title: 'Reise Unterlagen',
    subtitle: 'Buchungen, Tickets, Nachweise',
  ),
];

const _initialUploads = [
  MockUploadItem(
    id: 'upload-1',
    title: 'Laborbefund Blutwerte',
    source: 'iPhone Capture',
    createdLabel: 'heute, 09:42',
    status: MockUploadStatus.uploaded,
  ),
  MockUploadItem(
    id: 'upload-2',
    title: 'Mietvertrag Nachtrag',
    source: 'iPhone Capture',
    createdLabel: 'gestern, 18:10',
    status: MockUploadStatus.uploaded,
    caseId: 'case-apartment',
  ),
  MockUploadItem(
    id: 'upload-3',
    title: 'Kassenbeleg Apotheke',
    source: 'iPhone Capture',
    createdLabel: 'gestern, 17:58',
    status: MockUploadStatus.failed,
    failureReason: 'Upload abgebrochen',
  ),
];
