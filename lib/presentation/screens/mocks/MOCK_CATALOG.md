# DocMan Mock Catalog

Mocks are isolated concept-validation surfaces. They are launched through:

```bash
flutter run -d macos -t lib/main_mock_catalog.dart
```

or:

```bash
scripts/run_mocks.sh
```

Rules:

- no product navigation
- no real repositories
- no Drift, Isar, PocketBase, Home Hub, Microcks, file storage or external API calls
- synthetic data only

## Mock 01 - Mobile Capture to Draft-Inbox

Path: `lib/presentation/screens/mocks/mock_01_mobile_capture_inbox/`

Purpose: validate whether Mobile Capture, Upload Queue, Draft-Inbox review and optional case assignment feel right as the MVP core.

Stage: interactive Flutter-only mock.

### ASCII Layout

```text
+-------------------------------------------------------------+
| <- Back  Mock 01: Mobile Capture -> Draft-Inbox             |
+-------------------------------------------------------------+
| [Add upload] [Offline] [Fail next] [Reset]                  |
+-------------------------------------------------------------+
| Status strip: Queue, Inbox, Assigned                         |
+-------------------------------------------------------------+
| Mobile pane                 | Desktop pane                   |
| - capture card              | - draft inbox list             |
| - upload queue              | - selected document review     |
|                             | - assign to case action        |
+-------------------------------------------------------------+
```

### Widget Tree

```text
MobileCaptureInboxMockScreen
  Scaffold
    AppBar
    MockHelperBar
    LayoutBuilder
      _MockSummaryStrip
      _MobileCapturePane
      _DraftInboxPane
        _DraftList
        _DraftReviewPanel
```
