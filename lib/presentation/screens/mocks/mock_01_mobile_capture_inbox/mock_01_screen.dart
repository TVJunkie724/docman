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
                                    onAssign: _controller.assignSelectedUpload,
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
                              onAssign: _controller.assignSelectedUpload,
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
    required this.onAssign,
    required this.onRetry,
  });

  final MobileCaptureInboxMockState state;
  final ValueChanged<String> onSelect;
  final ValueChanged<String> onAssign;
  final ValueChanged<String> onRetry;

  @override
  Widget build(BuildContext context) {
    final drafts = state.uploads.where((upload) => upload.isDraft).toList();
    final selectedUpload = state.selectedUpload;

    return _Panel(
      title: 'Draft-Inbox',
      subtitle: 'Desktop prueft mobile Uploads und ordnet sie zu',
      icon: Icons.inbox_outlined,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final split = constraints.maxWidth >= 720;
          final list = _DraftList(
            uploads: drafts,
            selectedId: selectedUpload?.id,
            onSelect: onSelect,
          );
          final review = _DraftReviewPanel(
            upload: selectedUpload,
            cases: state.cases,
            onAssign: onAssign,
            onRetry: onRetry,
          );

          if (!split) {
            return Column(children: [list, const SizedBox(height: 16), review]);
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 260, child: list),
              const SizedBox(width: 16),
              Expanded(child: review),
            ],
          );
        },
      ),
    );
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
    required this.onSelect,
  });

  final List<MockUploadItem> uploads;
  final String? selectedId;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    if (uploads.isEmpty) {
      return const _EmptyState(
        icon: Icons.inbox_outlined,
        title: 'Draft-Inbox leer',
        body:
            'Mobile Uploads erscheinen hier, bevor sie einem Vorgang zugeordnet werden.',
      );
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
    required this.onAssign,
    required this.onRetry,
  });

  final MockUploadItem? upload;
  final List<MockCaseItem> cases;
  final ValueChanged<String> onAssign;
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
            _AssignedMessage(upload: currentUpload, cases: cases),
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

class _AssignedMessage extends StatelessWidget {
  const _AssignedMessage({required this.upload, required this.cases});

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
      child: Row(
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
