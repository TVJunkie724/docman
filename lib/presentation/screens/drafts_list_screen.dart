import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/app_shell.dart';
import '../widgets/common_widgets.dart';
import 'incident_detail_screen.dart';

class DraftsListScreen extends StatefulWidget {
  const DraftsListScreen({super.key});

  @override
  State<DraftsListScreen> createState() => _DraftsListScreenState();
}

class _DraftsListScreenState extends State<DraftsListScreen> {
  bool _isMyDraftsSelected = true;

  @override
  Widget build(BuildContext context) {
    return AppShell(
      activeItem: "Drafts",
      initialSidebarCollapsed: true, // Collapsed sidebar for sub-pages
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header (Back button removed, handled by AppShell)
                Text(
                  "Drafts & Uploads",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 28), // Dynamic
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(
                    "Review pending documents before they become incidents.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16), // Dynamic
                  ),
                ),
                const SizedBox(height: 32),

                // Content Area (White Box)
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor, // Dynamic
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Theme.of(context).dividerColor), // Dynamic
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Tabs / Filters
                        Row(
                          children: [
                            InkWell(
                              onTap: () => setState(() => _isMyDraftsSelected = true),
                              child: FilterTab(
                                label: "My Drafts", 
                                count: 2, 
                                isActive: _isMyDraftsSelected
                              ),
                            ),
                            const SizedBox(width: 16),
                            InkWell(
                              onTap: () => setState(() => _isMyDraftsSelected = false),
                              child: FilterTab(
                                label: "Family Drafts", 
                                count: 1, 
                                isActive: !_isMyDraftsSelected
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        // Drafts List
                        Expanded(
                          child: ListView(
                            children: _isMyDraftsSelected 
                              ? _buildMyDrafts() 
                              : _buildFamilyDrafts(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMyDrafts() {
    return [
      TaskCard(
        title: "Scan from 25.11.2025",
        subtitle: "10:30 AM • 1 Page",
        badgeColor: Colors.green,
        badgeText: "Ready",
        icon: FontAwesomeIcons.fileInvoice,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const IncidentDetailScreen(incidentId: 'mock_1'),
            ),
          );
        },
      ),
      const SizedBox(height: 16),
      TaskCard(
        title: "IMG_20251124_1400.jpg",
        subtitle: "Uploaded Yesterday • 2.4 MB",
        badgeColor: Colors.green,
        badgeText: "Ready",
        icon: FontAwesomeIcons.image,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const IncidentDetailScreen(incidentId: 'mock_2'),
            ),
          );
        },
      ),
    ];
  }

  List<Widget> _buildFamilyDrafts() {
    return [
      TaskCard(
        title: "Invoice_7732.pdf",
        // Added uploader info here
        subtitle: "Uploaded by Alice • 2 hours ago",
        badgeColor: Colors.orange,
        badgeText: "Processing",
        icon: FontAwesomeIcons.filePdf,
        onTap: () {},
      ),
    ];
  }
}
