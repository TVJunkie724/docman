import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/app_shell.dart';
import '../../domain/entities/enums.dart';
import '../utils/incident_helpers.dart'; // Added

class IncidentDetailScreen extends StatefulWidget {
  final String incidentId;

  const IncidentDetailScreen({super.key, required this.incidentId});

  @override
  State<IncidentDetailScreen> createState() => _IncidentDetailScreenState();
}

class _IncidentDetailScreenState extends State<IncidentDetailScreen> {
  // Mock State
  IncidentType _selectedType = IncidentType.medical;
  IncidentStatus _currentStatus = IncidentStatus.paymentDue;
  bool _isEditorOpen = false;
  
  // Workflow is now derived from _selectedType.workflow

  // Scroll Controller & Keys
  final ScrollController _scrollController = ScrollController();
  final Map<IncidentStatus, GlobalKey> _statusKeys = {};

  @override
  void initState() {
    super.initState();
    // Initialize keys for all statuses
    for (var status in IncidentStatus.values) {
      _statusKeys[status] = GlobalKey();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToStatus(IncidentStatus status) {
    // Find the key for this status (or the group it belongs to)
    // For now, we map directly. In a real app with grouping, we'd map to the group key.
    final key = _statusKeys[status];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.1, // Align slightly below top
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      activeItem: "Drafts",
      initialSidebarCollapsed: true,
      backLabel: "Drafts", // Added
      child: Row(
        children: [
          // Main Content (Centered)
          Expanded(
            flex: 2,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor, // Dynamic
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: ListView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(32),
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 32),
                      _buildWorkflowSection(),
                      const SizedBox(height: 32),
                      _buildDescriptionPanel(),
                      const SizedBox(height: 24),
                      _buildConnectedIncidentsPanel(),
                      const SizedBox(height: 24),
                      _buildGeneralDocumentsPanel(),
                      const SizedBox(height: 24),
                      _buildDynamicWorkflowPanels(),
                      const SizedBox(height: 32),
                      _buildSaveButtons(),
                      const SizedBox(height: 80), // Bottom padding
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Side Panel (Document Editor)
          if (_isEditorOpen)
            Expanded(
              flex: 1,
              child: _DocumentEditorPanel(
                incidentType: _selectedType, // Added
                onClose: () => setState(() => _isEditorOpen = false),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: "Dr. Smith Visit - Annual Checkup",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24), // Dynamic
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: _selectedType.color.withOpacity(0.1), // Dynamic Color
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _selectedType.color.withOpacity(0.3)), // Dynamic Border
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<IncidentType>(
                        value: _selectedType,
                        isDense: true,
                        icon: Icon(Icons.arrow_drop_down, color: _selectedType.color),
                        items: IncidentType.values.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Row(
                              children: [
                                FaIcon(type.icon, size: 14, color: type.color),
                                const SizedBox(width: 8),
                                Text(
                                  type.name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold,
                                    color: type.color, // Colored Text
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _selectedType = val);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Rerun AI Button
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.auto_awesome, size: 16, color: Colors.purple),
                    label: const Text("Rerun AI Analysis", style: TextStyle(color: Colors.purple)),
                  ),
                  const Spacer(),
                  // Download All Button
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download, size: 16),
                    label: const Text("Download All"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
                      side: BorderSide(color: Theme.of(context).dividerColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWorkflowSection() {
    final workflow = _selectedType.workflow; // Use helper

    return _ContentPanel(
        title: "Workflow Status",
        child: Column(
      children: [
        // Visualizer (Wrap Layout)
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 16,
            children: workflow.asMap().entries.map((entry) {
              final index = entry.key;
              final status = entry.value;
              final isPast = workflow.indexOf(_currentStatus) > index;
              final isCurrent = status == _currentStatus;
              
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => _scrollToStatus(status),
                    borderRadius: BorderRadius.circular(20),
                    child: _WorkflowBadge(
                      label: status.name,
                      status: status,
                      state: isCurrent ? _WorkflowState.current : (isPast ? _WorkflowState.past : _WorkflowState.future),
                    ),
                  ),
                  if (index < workflow.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.arrow_forward, 
                        size: 16, 
                        color: Colors.grey.shade400
                      ),
                    ),
                ],
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 24),
        
        // Action Bar
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Skip Button - Only if next state is skippable (Mock logic: Payment is skippable)
            if (_currentStatus == IncidentStatus.paymentDue) 
              OutlinedButton.icon(
                onPressed: () {
                  // Mock Skip Logic
                },
                icon: const Icon(Icons.skip_next, size: 16),
                label: const Text("Skip: Payment"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey[700],
                  side: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            if (_currentStatus == IncidentStatus.paymentDue)
              const SizedBox(width: 16),
              
            ElevatedButton.icon(
              onPressed: () {
                // Mock Next Logic
              },
              icon: const Icon(Icons.arrow_forward, size: 16),
              label: const Text("Next: Paid"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B6B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  Widget _buildDescriptionPanel() {
    return _ContentPanel(
      title: "Description",
      child: TextFormField(
        initialValue: "Routine checkup with Dr. Smith. Prescribed antibiotics for throat infection. Follow-up needed in 2 weeks.",
        maxLines: 3,
        style: Theme.of(context).textTheme.bodyMedium, // Dynamic Text Color
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Theme.of(context).dividerColor)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Theme.of(context).dividerColor)),
          filled: true,
          fillColor: Theme.of(context).cardColor, // Dynamic Background
        ),
      ),
    );
  }

  Widget _buildConnectedIncidentsPanel() {
    return _ContentPanel(
      title: "Connected Incidents",
      action: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add, size: 16),
        label: const Text("Link Incident"),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const FaIcon(FontAwesomeIcons.link, size: 16, color: Colors.grey),
        title: const Text("Pharmacy Visit - Antibiotics", style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: const Text("Created 2 days ago"),
        trailing: IconButton(icon: const Icon(Icons.close, size: 16), onPressed: () {}),
      ),
    );
  }

  Widget _buildGeneralDocumentsPanel() {
    return _ContentPanel(
      title: "General Documents",
      action: OutlinedButton.icon(
        onPressed: () => setState(() => _isEditorOpen = true),
        icon: const Icon(Icons.upload_file, size: 16),
        label: const Text("Add Document"),
      ),
      child: const Text("No general documents.", style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
    );
  }

  Widget _buildDynamicWorkflowPanels() {
    final workflow = _selectedType.workflow;
    final currentIndex = workflow.indexOf(_currentStatus);

    // Filter states to only show up to current status
    // Group them into a single panel as requested ("not split up per state")
    final visibleStates = workflow.sublist(0, currentIndex + 1);

    // Aggregate documents for all visible states
    List<Widget> allDocs = [];
    for (var status in visibleStates) {
      if (status == IncidentStatus.paymentDue) {
         allDocs.add(
            _DocumentListItem(
              title: "Invoice_DrSmith.pdf",
              version: 2,
              status: IncidentStatus.paymentDue,
              onEdit: () => setState(() => _isEditorOpen = true),
            ),
         );
      }
      // Add other mock docs for other states here if needed
    }

    return Column(
      children: [
        Container(
          key: _statusKeys[visibleStates.first], // Key for the group (using first state)
          child: _WorkflowGroupPanel(
            states: visibleStates,
            documents: allDocs,
            isEmptyState: allDocs.isEmpty,
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () {
            // Mock Save Draft
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Draft Saved")));
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: const Text("Save Draft", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            // Mock Save
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Incident Saved")));
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6B6B),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
            elevation: 2,
          ),
          child: const Text("Save", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ],
    );
  }
}

// --- Helper Widgets ---

enum _WorkflowState { past, current, future }

class _WorkflowBadge extends StatelessWidget {
  final String label;
  final IncidentStatus status;
  final _WorkflowState state;

  const _WorkflowBadge({
    required this.label, 
    required this.status, 
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = status.color; // Use extension
    
    Color bgColor;
    Color textColor;
    BoxBorder? border;
    double elevation = 0;

    switch (state) {
      case _WorkflowState.past:
        // Past: Solid color, slightly muted/darker to indicate "done"
        bgColor = baseColor.withOpacity(0.8);
        textColor = Colors.white;
        break;
      case _WorkflowState.current:
        // Current: Bright, solid, with border/glow
        bgColor = baseColor; // Solid color for active state as requested
        textColor = Colors.white;
        elevation = 4;
        break;
      case _WorkflowState.future:
        // Future: Outline or very light background
        bgColor = Theme.of(context).cardColor; // Dynamic
        textColor = Colors.grey.shade400;
        border = Border.all(color: Theme.of(context).dividerColor);
        break;
    }

    return Material(
      elevation: elevation,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: border,
          boxShadow: state == _WorkflowState.current ? [
            BoxShadow(color: baseColor.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))
          ] : null,
        ),
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            color: textColor, 
            fontWeight: FontWeight.bold, 
            fontSize: 12
          ),
        ),
      ),
    );
  }
}

class _ContentPanel extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? action;

  const _ContentPanel({required this.title, required this.child, this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)), // Dynamic
            if (action != null) action!,
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor, // Dynamic
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).dividerColor), // Dynamic
          ),
          child: child,
        ),
      ],
    );
  }
}

class _WorkflowGroupPanel extends StatelessWidget {
  final List<IncidentStatus> states;
  final List<Widget> documents;
  final bool isEmptyState;

  const _WorkflowGroupPanel({required this.states, required this.documents, this.isEmptyState = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // Dynamic
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor), // Dynamic
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Badges
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark 
                  ? Colors.grey.shade900 
                  : Colors.grey.shade50, // Dynamic Header
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)), // Dynamic
            ),
            child: Row(
              children: [
                ...states.asMap().entries.map((entry) {
                  final index = entry.key;
                  final s = entry.value;
                  final isLast = index == states.length - 1;
                  
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _MiniBadge(
                      label: s.name,
                      color: isLast ? s.color : null, // Highlight last
                      textColor: isLast ? Colors.white : null,
                    ),
                  );
                }),
                const Spacer(),
                if (!isEmptyState)
                  IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () {}, tooltip: "Add Document"),
              ],
            ),
          ),
          // Content
          if (documents.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(children: documents),
            )
          else
            const Padding(
              padding: EdgeInsets.all(24),
              child: Text("No documents in this stage.", style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
            ),
        ],
      ),
    );
  }
}

class _MiniBadge extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;

  const _MiniBadge({required this.label, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label.toUpperCase(), 
        style: TextStyle(
          fontSize: 10, 
          fontWeight: FontWeight.bold, 
          color: textColor ?? Colors.grey.shade700
        )
      ),
    );
  }
}

class _DocumentListItem extends StatefulWidget {
  final String title;
  final int version;
  final IncidentStatus status;
  final VoidCallback onEdit;

  const _DocumentListItem({
    required this.title,
    required this.version,
    required this.status,
    required this.onEdit,
  });

  @override
  State<_DocumentListItem> createState() => _DocumentListItemState();
}

class _DocumentListItemState extends State<_DocumentListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Row
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const FaIcon(FontAwesomeIcons.filePdf, color: Colors.red, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.title} (v${widget.version})", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text("Uploaded today by Me", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () => setState(() => _isExpanded = !_isExpanded),
                        child: Row(
                          children: [
                            Text(_isExpanded ? "Hide history" : "Show 1 previous version", style: const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w600)),
                            Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 14, color: Colors.blue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: Text(widget.status.name.toUpperCase(), style: const TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 16),
            IconButton(icon: const Icon(Icons.download, size: 20, color: Colors.grey), onPressed: () {}, tooltip: "Download"),
            IconButton(icon: const Icon(Icons.visibility, size: 20, color: Colors.grey), onPressed: () {}),
            IconButton(icon: const Icon(Icons.edit, size: 20, color: Colors.grey), onPressed: widget.onEdit),
            IconButton(icon: const FaIcon(FontAwesomeIcons.fileCirclePlus, size: 18, color: Colors.grey), onPressed: () {}, tooltip: "New Version"),
            IconButton(icon: const Icon(Icons.delete, size: 20, color: Colors.grey), onPressed: () {}),
          ],
        ),
        
        // Expanded History
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 56, top: 12),
            child: Column(
              children: [
                Container(height: 1, color: Colors.grey.shade100),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.filePdf, color: Colors.grey, size: 16),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${widget.title} (v1)", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey[700])),
                          Text("Uploaded yesterday", style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                        ],
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.visibility, size: 18, color: Colors.grey), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _DocumentEditorPanel extends StatelessWidget {
  final VoidCallback onClose;
  final IncidentType incidentType; // Added

  const _DocumentEditorPanel({
    required this.onClose,
    required this.incidentType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // Dynamic
        border: Border(left: BorderSide(color: Theme.of(context).dividerColor)), // Dynamic
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(-5, 0))],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text("Edit Document", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)), // Dynamic
                const Spacer(),
                IconButton(icon: const Icon(Icons.close), onPressed: onClose),
              ],
            ),
          ),
          const Divider(height: 1),
          
          // Form (Top Half)
          Expanded(
            flex: 1,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                // AI Analysis Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.auto_awesome, size: 16),
                    label: const Text("Run AI Analysis"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade50,
                      foregroundColor: Colors.purple,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                TextFormField(
                  initialValue: "Invoice_DrSmith.pdf",
                  decoration: const InputDecoration(labelText: "Title", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<IncidentStatus>(
                  value: IncidentStatus.paymentDue,
                  decoration: const InputDecoration(labelText: "Workflow State", border: OutlineInputBorder()),
                  items: incidentType.workflow.map((s) { // Filtered by workflow
                    return DropdownMenuItem(
                      value: s, 
                      child: Row(
                        children: [
                          Container(
                            width: 12, 
                            height: 12, 
                            decoration: BoxDecoration(
                              color: s.color, // Colored dot
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            s.name.toUpperCase(),
                            style: TextStyle(
                              color: s.color, // Colored text
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {},
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: "150.00",
                  decoration: const InputDecoration(labelText: "Amount", border: OutlineInputBorder(), suffixText: "EUR"),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(onPressed: () {}, child: const Text("Save Draft"))),
                    const SizedBox(width: 16),
                    Expanded(child: ElevatedButton(onPressed: onClose, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF6B6B), foregroundColor: Colors.white), child: const Text("Save"))),
                  ],
                ),
              ],
            ),
          ),
          
          const Divider(height: 1),
          
          // Preview (Bottom Half)
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.shade100,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.image, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text("Document Preview", style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
