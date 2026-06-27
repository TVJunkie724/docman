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

Purpose: validate whether Mobile Capture, Upload Queue, Eingang review and optional case assignment feel right as the MVP core.

Stage: interactive Flutter-only mock.

Current focus:

- Eingang sections: `Offen`, `Aufmerksamkeit`, `Zuletzt erledigt`
- quick correction path for recently assigned documents
- link from recently assigned documents to the related case
- export, print and mail preparation belong later in the case/document detail, not in Eingang

### ASCII Layout

```text
+-------------------------------------------------------------+
| <- Back  Mock 01: Mobile Capture -> Draft-Inbox             |
+-------------------------------------------------------------+
| [Add upload] [Offline] [Fail next] [Reset]                  |
+-------------------------------------------------------------+
| Status strip: Queue, Offen, Aufmerksamkeit, Erledigt         |
+-------------------------------------------------------------+
| Mobile pane                 | Desktop pane                   |
| - capture card              | - draft inbox list             |
| - upload queue              | - Eingang tabs                 |
|                             | - selected document review     |
|                             | - assign/correct case action   |
|                             | - open related case link       |
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
