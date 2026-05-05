import 'package:flutter/material.dart';

import 'mock_01_controller.dart';
import 'mock_01_state.dart';

class MobileCaptureInboxMockScreen extends StatefulWidget {
  const MobileCaptureInboxMockScreen({super.key});

  @override
  State<MobileCaptureInboxMockScreen> createState() =>
      _MobileCaptureInboxMockScreenState();
}

class _MobileCaptureInboxMockScreenState
    extends State<MobileCaptureInboxMockScreen> {
  late final MobileCaptureInboxMockController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MobileCaptureInboxMockController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final state = _controller.value;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Mock 01: Mobile Capture -> Draft-Inbox'),
          ),
          body: SafeArea(
            child: Column(
              children: [
                _MockHelperBar(
                  isOffline: state.isOffline,
                  failNextUpload: state.failNextUpload,
                  onAddUpload: _controller.addSyntheticCapture,
                  onToggleOffline: _controller.toggleOffline,
                  onToggleFailNext: _controller.toggleFailNextUpload,
                  onReset: _controller.reset,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth >= 980;

                      return ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          _SummaryStrip(state: state),
                          const SizedBox(height: 20),
                          if (isWide)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: _MobileCapturePane(
                                    state: state,
                                    onRetry: _controller.retryUpload,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  flex: 6,
                                  child: _DraftInboxPane(
                                    state: state,
                                    onSelect: _controller.selectUpload,
                                    onSelectSection: _controller.selectSection,
                                    onAssign: _controller.assignSelectedUpload,
                                    onMoveBack:
                                        _controller.moveSelectedBackToInbox,
                                    onRetry: _controller.retryUpload,
                                  ),
                                ),
                              ],
                            )
                          else ...[
                            _MobileCapturePane(
                              state: state,
                              onRetry: _controller.retryUpload,
                            ),
                            const SizedBox(height: 20),
                            _DraftInboxPane(
                              state: state,
                              onSelect: _controller.selectUpload,
                              onSelectSection: _controller.selectSection,
                              onAssign: _controller.assignSelectedUpload,
                              onMoveBack: _controller.moveSelectedBackToInbox,
                              onRetry: _controller.retryUpload,
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MockHelperBar extends StatelessWidget {
  const _MockHelperBar({
    required this.isOffline,
    required this.failNextUpload,
    required this.onAddUpload,
    required this.onToggleOffline,
    required this.onToggleFailNext,
    required this.onReset,
  });

  final bool isOffline;
  final bool failNextUpload;
  final VoidCallback onAddUpload;
  final VoidCallback onToggleOffline;
  final VoidCallback onToggleFailNext;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.cardColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            FilledButton.icon(
              onPressed: onAddUpload,
              icon: const Icon(Icons.document_scanner_outlined),
              label: const Text('Upload simulieren'),
            ),
            const SizedBox(width: 8),
            FilterChip(
              selected: isOffline,
              onSelected: (_) => onToggleOffline(),
              avatar: Icon(isOffline ? Icons.wifi_off : Icons.wifi),
              label: Text(isOffline ? 'Offline' : 'Online'),
            ),
            const SizedBox(width: 8),
            FilterChip(
              selected: failNextUpload,
              onSelected: (_) => onToggleFailNext(),
              avatar: const Icon(Icons.error_outline),
              label: const Text('naechster Upload scheitert'),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: onReset,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryStrip extends StatelessWidget {
  const _SummaryStrip({required this.state});

  final MobileCaptureInboxMockState state;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _SummaryPill(
          icon: Icons.cloud_upload_outlined,
          label: 'Queue',
          value: state.queuedCount.toString(),
        ),
        _SummaryPill(
          icon: Icons.inbox_outlined,
          label: 'Draft-Inbox',
          value: state.draftCount.toString(),
        ),
        _SummaryPill(
          icon: Icons.priority_high_outlined,
          label: 'Aufmerksamkeit',
          value: state.attentionCount.toString(),
        ),
        _SummaryPill(
          icon: Icons.folder_copy_outlined,
          label: 'Zugeordnet',
          value: state.assignedCount.toString(),
        ),
        _SummaryPill(
          icon: state.isOffline ? Icons.wifi_off : Icons.wifi,
          label: 'Home Hub',
          value: state.isOffline ? 'offline' : 'bereit',
        ),
      ],
    );
  }
}

class _SummaryPill extends StatelessWidget {
  const _SummaryPill({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: colors.primary),
          const SizedBox(width: 8),
          Text(label, style: theme.textTheme.labelLarge),
          const SizedBox(width: 8),
          Text(
            value,
            style: theme.textTheme.labelLarge?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileCapturePane extends StatelessWidget {
  const _MobileCapturePane({required this.state, required this.onRetry});

  final MobileCaptureInboxMockState state;
  final ValueChanged<String> onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final queueItems = state.uploads
        .where(
          (upload) =>
              upload.status == MockUploadStatus.queued ||
              upload.status == MockUploadStatus.uploading ||
              upload.status == MockUploadStatus.failed,
        )
        .toList();

    return _Panel(
      title: 'Mobile Capture',
      subtitle: 'Capture-only Flow mit lokaler Queue',
      icon: Icons.phone_iphone,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.document_scanner_outlined,
                  size: 32,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 12),
                Text(
                  'Foto oder Scan erfassen',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  'Mobil bleibt bewusst schlank: erfassen, optional Vorgang waehlen, sicher hochladen.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text('Upload-Queue', style: theme.textTheme.titleMedium),
          const SizedBox(height: 10),
          if (queueItems.isEmpty)
            const _EmptyState(
              icon: Icons.done_all,
              title: 'Keine offenen Uploads',
              body: 'Neue Scans landen hier, bis der Home Hub sie annimmt.',
            )
          else
            for (final upload in queueItems) ...[
              _UploadQueueItem(upload: upload, onRetry: onRetry),
              const SizedBox(height: 10),
            ],
        ],
      ),
    );
  }
}

class _DraftInboxPane extends StatelessWidget {
  const _DraftInboxPane({
    required this.state,
    required this.onSelect,
    required this.onSelectSection,
    required this.onAssign,
    required this.onMoveBack,
    required this.onRetry,
  });

  final MobileCaptureInboxMockState state;
  final ValueChanged<String> onSelect;
  final ValueChanged<MockInboxSection> onSelectSection;
  final ValueChanged<String> onAssign;
  final VoidCallback onMoveBack;
  final ValueChanged<String> onRetry;

  @override
  Widget build(BuildContext context) {
    final sectionUploads = _uploadsForSection(
      state.uploads,
      state.selectedSection,
    );
    final selectedUpload =
        sectionUploads.any((upload) => upload.id == state.selectedUpload?.id)
        ? state.selectedUpload
        : null;

    return _Panel(
      title: 'Eingang',
      subtitle: 'Offen, Aufmerksamkeit und zuletzt erledigt',
      icon: Icons.inbox_outlined,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final split = constraints.maxWidth >= 720;
          final list = _DraftList(
            uploads: sectionUploads,
            selectedId: selectedUpload?.id,
            section: state.selectedSection,
            onSelect: onSelect,
          );
          final review = _DraftReviewPanel(
            upload: selectedUpload,
            cases: state.cases,
            lastActionLabel: state.lastActionLabel,
            onAssign: onAssign,
            onMoveBack: onMoveBack,
            onRetry: onRetry,
          );
          final tabs = _InboxTabs(
            selectedSection: state.selectedSection,
            openCount: state.draftCount,
            attentionCount: state.attentionCount,
            recentCount: state.assignedCount,
            onSelectSection: onSelectSection,
          );

          if (!split) {
            return Column(
              children: [
                tabs,
                const SizedBox(height: 16),
                list,
                const SizedBox(height: 16),
                review,
              ],
            );
          }

          return Column(
            children: [
              tabs,
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 280, child: list),
                  const SizedBox(width: 16),
                  Expanded(child: review),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  List<MockUploadItem> _uploadsForSection(
    List<MockUploadItem> uploads,
    MockInboxSection section,
  ) {
    return switch (section) {
      MockInboxSection.open =>
        uploads.where((upload) => upload.isDraft).toList(),
      MockInboxSection.attention =>
        uploads
            .where(
              (upload) =>
                  upload.status == MockUploadStatus.failed ||
                  upload.status == MockUploadStatus.queued,
            )
            .toList(),
      MockInboxSection.recent =>
        uploads.where((upload) => upload.isAssigned).toList(),
    };
  }
}

class _Panel extends StatelessWidget {
  const _Panel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.child,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 2),
                    Text(subtitle, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class _InboxTabs extends StatelessWidget {
  const _InboxTabs({
    required this.selectedSection,
    required this.openCount,
    required this.attentionCount,
    required this.recentCount,
    required this.onSelectSection,
  });

  final MockInboxSection selectedSection;
  final int openCount;
  final int attentionCount;
  final int recentCount;
  final ValueChanged<MockInboxSection> onSelectSection;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _InboxTabChip(
          section: MockInboxSection.open,
          selectedSection: selectedSection,
          label: 'Offen',
          count: openCount,
          icon: Icons.inbox_outlined,
          onSelectSection: onSelectSection,
        ),
        _InboxTabChip(
          section: MockInboxSection.attention,
          selectedSection: selectedSection,
          label: 'Aufmerksamkeit',
          count: attentionCount,
          icon: Icons.priority_high_outlined,
          onSelectSection: onSelectSection,
        ),
        _InboxTabChip(
          section: MockInboxSection.recent,
          selectedSection: selectedSection,
          label: 'Zuletzt erledigt',
          count: recentCount,
          icon: Icons.history,
          onSelectSection: onSelectSection,
        ),
      ],
    );
  }
}

class _InboxTabChip extends StatelessWidget {
  const _InboxTabChip({
    required this.section,
    required this.selectedSection,
    required this.label,
    required this.count,
    required this.icon,
    required this.onSelectSection,
  });

  final MockInboxSection section;
  final MockInboxSection selectedSection;
  final String label;
  final int count;
  final IconData icon;
  final ValueChanged<MockInboxSection> onSelectSection;

  @override
  Widget build(BuildContext context) {
    final selected = section == selectedSection;

    return FilterChip(
      selected: selected,
      showCheckmark: false,
      avatar: Icon(icon),
      label: Text('$label $count'),
      onSelected: (_) => onSelectSection(section),
    );
  }
}

class _UploadQueueItem extends StatelessWidget {
  const _UploadQueueItem({required this.upload, required this.onRetry});

  final MockUploadItem upload;
  final ValueChanged<String> onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _StatusIcon(status: upload.status),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(upload.title, style: theme.textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(
                  upload.failureReason ?? upload.source,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          if (upload.status == MockUploadStatus.failed ||
              upload.status == MockUploadStatus.queued)
            IconButton(
              tooltip: 'Upload erneut versuchen',
              onPressed: () => onRetry(upload.id),
              icon: const Icon(Icons.refresh),
            ),
        ],
      ),
    );
  }
}

class _DraftList extends StatelessWidget {
  const _DraftList({
    required this.uploads,
    required this.selectedId,
    required this.section,
    required this.onSelect,
  });

  final List<MockUploadItem> uploads;
  final String? selectedId;
  final MockInboxSection section;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    if (uploads.isEmpty) {
      final (icon, title, body) = switch (section) {
        MockInboxSection.open => (
          Icons.inbox_outlined,
          'Nichts offen',
          'Neue mobile Uploads erscheinen hier, bevor sie einem Vorgang zugeordnet werden.',
        ),
        MockInboxSection.attention => (
          Icons.done_all,
          'Keine Aufmerksamkeit noetig',
          'Fehler, Warteschlangen und unklare Uploads landen hier.',
        ),
        MockInboxSection.recent => (
          Icons.history,
          'Noch nichts erledigt',
          'Gerade zugeordnete Dokumente bleiben kurz fuer Korrekturen erreichbar.',
        ),
      };

      return _EmptyState(icon: icon, title: title, body: body);
    }

    return Column(
      children: [
        for (final upload in uploads) ...[
          _DraftListItem(
            upload: upload,
            isSelected: upload.id == selectedId,
            onTap: () => onSelect(upload.id),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _DraftListItem extends StatelessWidget {
  const _DraftListItem({
    required this.upload,
    required this.isSelected,
    required this.onTap,
  });

  final MockUploadItem upload;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Material(
      color: isSelected
          ? colors.primary.withValues(alpha: 0.10)
          : theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? colors.primary : theme.dividerColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.description_outlined),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(upload.title, style: theme.textTheme.titleSmall),
                    const SizedBox(height: 3),
                    Text(upload.createdLabel, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DraftReviewPanel extends StatelessWidget {
  const _DraftReviewPanel({
    required this.upload,
    required this.cases,
    required this.lastActionLabel,
    required this.onAssign,
    required this.onMoveBack,
    required this.onRetry,
  });

  final MockUploadItem? upload;
  final List<MockCaseItem> cases;
  final String? lastActionLabel;
  final ValueChanged<String> onAssign;
  final VoidCallback onMoveBack;
  final ValueChanged<String> onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (upload == null) {
      return const _EmptyState(
        icon: Icons.search,
        title: 'Kein Dokument ausgewaehlt',
        body: 'Waehle einen Draft, um ihn zu pruefen.',
      );
    }

    final currentUpload = upload!;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _StatusIcon(status: currentUpload.status),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  currentUpload.title,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              _StatusBadge(upload: currentUpload),
            ],
          ),
          const SizedBox(height: 14),
          _DocumentPreview(upload: currentUpload),
          const SizedBox(height: 16),
          if (lastActionLabel != null) ...[
            _ActionNotice(message: lastActionLabel!),
            const SizedBox(height: 16),
          ],
          if (currentUpload.status == MockUploadStatus.failed) ...[
            Text(
              currentUpload.failureReason ?? 'Upload fehlgeschlagen',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () => onRetry(currentUpload.id),
              icon: const Icon(Icons.refresh),
              label: const Text('Erneut versuchen'),
            ),
          ] else if (currentUpload.isAssigned) ...[
            _AssignedMessage(
              upload: currentUpload,
              cases: cases,
              onMoveBack: onMoveBack,
            ),
            const SizedBox(height: 16),
            Text('Zuordnung korrigieren', style: theme.textTheme.titleSmall),
            const SizedBox(height: 10),
            for (final caseItem in cases) ...[
              _CaseOption(caseItem: caseItem, onAssign: onAssign),
              const SizedBox(height: 8),
            ],
            const SizedBox(height: 16),
            _OpenCaseHint(upload: currentUpload, cases: cases),
          ] else if (currentUpload.isDraft) ...[
            Text('Vorgang zuordnen', style: theme.textTheme.titleSmall),
            const SizedBox(height: 10),
            for (final caseItem in cases) ...[
              _CaseOption(caseItem: caseItem, onAssign: onAssign),
              const SizedBox(height: 8),
            ],
            const SizedBox(height: 4),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.schedule),
              label: const Text('Spaeter zuordnen'),
            ),
          ] else ...[
            const LinearProgressIndicator(),
            const SizedBox(height: 10),
            Text('Upload wird verarbeitet', style: theme.textTheme.bodyMedium),
          ],
        ],
      ),
    );
  }
}

class _DocumentPreview extends StatelessWidget {
  const _DocumentPreview({required this.upload});

  final MockUploadItem upload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 160, height: 14, color: theme.dividerColor),
          const SizedBox(height: 14),
          Container(width: 220, height: 10, color: theme.dividerColor),
          const SizedBox(height: 8),
          Container(width: 190, height: 10, color: theme.dividerColor),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.auto_awesome_outlined, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Synthetische Vorschau: keine echten Dokumentinhalte.',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CaseOption extends StatelessWidget {
  const _CaseOption({required this.caseItem, required this.onAssign});

  final MockCaseItem caseItem;
  final ValueChanged<String> onAssign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: () => onAssign(caseItem.id),
      style: OutlinedButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        children: [
          const Icon(Icons.folder_outlined),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(caseItem.title, style: theme.textTheme.titleSmall),
                const SizedBox(height: 2),
                Text(caseItem.subtitle, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionNotice extends StatelessWidget {
  const _ActionNotice({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(child: Text(message, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}

class _AssignedMessage extends StatelessWidget {
  const _AssignedMessage({
    required this.upload,
    required this.cases,
    required this.onMoveBack,
  });

  final MockUploadItem upload;
  final List<MockCaseItem> cases;
  final VoidCallback onMoveBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final caseItem = cases.firstWhere(
      (item) => item.id == upload.caseId,
      orElse: () => const MockCaseItem(
        id: 'unknown',
        title: 'Vorgang',
        subtitle: 'bereits zugeordnet',
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.green),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Zugeordnet zu "${caseItem.title}".',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Bleibt kurz in "Zuletzt erledigt", damit eine falsche Zuordnung schnell korrigiert werden kann.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: onMoveBack,
            icon: const Icon(Icons.undo),
            label: const Text('Zurueck nach Offen'),
          ),
          const SizedBox(height: 4),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.open_in_new),
            label: const Text('Vorgang oeffnen'),
          ),
        ],
      ),
    );
  }
}

class _OpenCaseHint extends StatelessWidget {
  const _OpenCaseHint({required this.upload, required this.cases});

  final MockUploadItem upload;
  final List<MockCaseItem> cases;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final caseItem = cases.firstWhere(
      (item) => item.id == upload.caseId,
      orElse: () => const MockCaseItem(
        id: 'unknown',
        title: 'Vorgang',
        subtitle: 'Dokument ist zugeordnet',
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.folder_open_outlined, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Exportieren, Drucken und Mail vorbereiten gehoeren spaeter in "${caseItem.title}" oder ins Dokumentdetail.',
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  const _StatusIcon({required this.status});

  final MockUploadStatus status;

  @override
  Widget build(BuildContext context) {
    final (icon, color) = switch (status) {
      MockUploadStatus.queued => (Icons.schedule, Colors.orange),
      MockUploadStatus.uploading => (Icons.sync, Colors.blue),
      MockUploadStatus.uploaded => (Icons.check_circle_outline, Colors.green),
      MockUploadStatus.failed => (Icons.error_outline, Colors.red),
    };

    return Icon(icon, color: color);
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.upload});

  final MockUploadItem upload;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (upload.status) {
      MockUploadStatus.queued => ('wartet', Colors.orange),
      MockUploadStatus.uploading => ('upload', Colors.blue),
      MockUploadStatus.uploaded =>
        upload.isAssigned
            ? ('zugeordnet', Colors.green)
            : ('draft', Colors.teal),
      MockUploadStatus.failed => ('fehler', Colors.red),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: theme.colorScheme.primary),
          const SizedBox(height: 10),
          Text(title, style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          Text(body, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
