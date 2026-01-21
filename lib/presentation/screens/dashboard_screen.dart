import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart'; // Added for themeNotifier
import '../widgets/app_shell.dart'; // Added
import 'incident_detail_screen.dart';
import 'drafts_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return AppShell(
      activeItem: "Dashboard",
      floatingActionButton: _QuickActionsFab(),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning, Alex",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
                ),
                const SizedBox(height: 8),
                Text(
                  "Here is your daily overview.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 32),

                // Overview Section
                const _OverviewSection(),
                const SizedBox(height: 40),
                
                // Tabs / Filters
                Row(
                  children: [
                    _FilterTab(label: "My Tasks", count: 4, isActive: true),
                    const SizedBox(width: 16),
                    _FilterTab(label: "All Family Tasks", count: 12, isActive: false),
                  ],
                ),
                const SizedBox(height: 24),

                // Task List
                Expanded(
                  child: ListView(
                    children: const [
                      _TaskCard(
                        title: "Pay Electric Bill",
                        subtitle: "Due Today • \$145.00",
                        badgeColor: Colors.redAccent,
                        badgeText: "Urgent",
                        icon: FontAwesomeIcons.fileInvoiceDollar,
                      ),
                      SizedBox(height: 16),
                      _TaskCard(
                        title: "Sign School Permission Slip",
                        subtitle: "Alice • Field Trip to Zoo",
                        badgeColor: Colors.blueAccent,
                        badgeText: "To Sign",
                        icon: FontAwesomeIcons.fileSignature,
                      ),
                      SizedBox(height: 16),
                      _TaskCard(
                        title: "Review Car Insurance Renewal",
                        subtitle: "Expires in 14 days",
                        badgeColor: Colors.orangeAccent,
                        badgeText: "Review",
                        icon: FontAwesomeIcons.car,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OverviewSection extends StatelessWidget {
  const _OverviewSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _OverviewCard(
            title: "Financial",
            value: "€ 450.00",
            subtitle: "Due this month",
            icon: FontAwesomeIcons.wallet,
            color: Colors.redAccent,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _OverviewCard(
            title: "Drafts",
            value: "3 New",
            subtitle: "Scans & Uploads",
            icon: FontAwesomeIcons.inbox,
            color: Colors.orangeAccent,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const DraftsListScreen()),
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _OverviewCard(
            title: "Notifications",
            value: "2 Alerts",
            subtitle: "System Updates",
            icon: FontAwesomeIcons.bell,
            color: Colors.purpleAccent,
            onTap: () {},
          ),
        ),
        // Spacer to keep cards same width if we want 4 columns, or just let them expand.
        // Let's keep them expanded to fill the space nicely.
      ],
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _OverviewCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, // Dynamic
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).dividerColor), // Dynamic
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FaIcon(icon, size: 16, color: color),
                ),
                const Spacer(),
                Icon(Icons.arrow_forward, size: 16, color: Colors.grey[400]),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20), // Dynamic
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.w600), // Dynamic
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final int count;
  final bool isActive;

  const _FilterTab({required this.label, required this.count, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final cardColor = Theme.of(context).cardColor;
    final dividerColor = Theme.of(context).dividerColor;
    final textColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey[600];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? primaryColor : cardColor, // Warmer active color
        borderRadius: BorderRadius.circular(24),
        border: isActive ? null : Border.all(color: dividerColor),
        boxShadow: isActive ? [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ] : null,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: isActive ? Colors.white.withOpacity(0.2) : dividerColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color badgeColor;
  final String badgeText;
  final IconData icon;

  const _TaskCard({
    required this.title,
    required this.subtitle,
    required this.badgeColor,
    required this.badgeText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // Dynamic
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor), // Dynamic
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: badgeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: FaIcon(icon, color: badgeColor, size: 24),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18), // Dynamic
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.w500), // Dynamic
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: badgeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                color: badgeColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Icon(Icons.chevron_right, color: Colors.grey[300]),
        ],
      ),
    );
  }
}

class _QuickActionsFab extends StatefulWidget {
  @override
  State<_QuickActionsFab> createState() => _QuickActionsFabState();
}

class _QuickActionsFabState extends State<_QuickActionsFab> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: _isExpanded ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_isExpanded) ...[
          _buildFabOption(
            icon: FontAwesomeIcons.noteSticky,
            label: "Create Note",
            color: Colors.green,
            onTap: () {
              _toggle();
              _showNoteDialog(context);
            },
          ),
          const SizedBox(height: 16),
          _buildFabOption(
            icon: FontAwesomeIcons.upload,
            label: "Upload File",
            color: Colors.orangeAccent,
            onTap: () {
              _toggle();
            },
          ),
          const SizedBox(height: 16),
          _buildFabOption(
            icon: FontAwesomeIcons.camera,
            label: "Scan Document",
            color: Colors.blueAccent,
            onTap: () {
              _toggle();
            },
          ),
          const SizedBox(height: 24),
        ],
        FloatingActionButton.large(
          onPressed: _toggle,
          backgroundColor: Theme.of(context).primaryColor, // Dynamic
          elevation: 4,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 0.125).animate(_controller), // Rotate 45 deg
            child: const Icon(Icons.add, color: Colors.white, size: 36),
          ),
        ),
      ],
    );
  }

  Widget _buildFabOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ScaleTransition(
      scale: _expandAnimation,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor, // Dynamic
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyMedium?.color), // Dynamic
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton.small(
            onPressed: onTap,
            backgroundColor: color,
            child: FaIcon(icon, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  void _showNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create Note"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.add_circle_outline, color: Colors.green),
              ),
              title: const Text("New Incident", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("Start a fresh topic"),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.search, color: Colors.blue),
              ),
              title: const Text("Add to Existing", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("Search for an open incident"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
