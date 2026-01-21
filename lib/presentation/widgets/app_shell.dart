import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart'; // Added for themeNotifier
import '../screens/dashboard_screen.dart';
import '../screens/drafts_list_screen.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  final String activeItem; // "Dashboard", "Drafts", etc.
  final bool initialSidebarCollapsed;
  final String? backLabel;
  final Widget? floatingActionButton; // Added

  const AppShell({
    super.key,
    required this.child,
    required this.activeItem,
    this.initialSidebarCollapsed = false,
    this.backLabel,
    this.floatingActionButton,
  });

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late bool _isSidebarCollapsed;

  @override
  void initState() {
    super.initState();
    _isSidebarCollapsed = widget.initialSidebarCollapsed;
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarCollapsed = !_isSidebarCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Dynamic
      body: Column(
        children: [
          _TopBar(
            isSidebarCollapsed: _isSidebarCollapsed,
            backLabel: widget.backLabel,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LeftNavigation(
                  isCollapsed: _isSidebarCollapsed, 
                  activeItem: widget.activeItem,
                  onToggleSidebar: _toggleSidebar,
                ),
                Expanded(child: widget.child),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: widget.floatingActionButton, // Added
    );
  }
}

class _TopBar extends StatelessWidget {
  final bool isSidebarCollapsed;
  final String? backLabel; // Added

  const _TopBar({
    required this.isSidebarCollapsed,
    this.backLabel,
  });

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.of(context).canPop();

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor, // Dynamic
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          Image.asset('assets/images/logo.png', width: 32, height: 32),
          const SizedBox(width: 12),
          const Text(
            "DocMan",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 24),

          // Back Button (Right of Logo)
          if (canPop)
            TextButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
              label: Text(
                backLabel ?? "Back", // Use label if provided
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.2),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),

          const SizedBox(width: 24),

          // Mobile Menu Button (Hidden on Desktop)
          if (MediaQuery.of(context).size.width <= 900)
            IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () {}),
            
          const Spacer(),
          
          // Search
          Container(
            width: 300,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.white70, size: 20),
                const SizedBox(width: 8),
                Text("Search...", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(width: 24),
          
          // Actions
          IconButton(
            icon: Icon(
              themeNotifier.value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode, 
              color: Colors.white, 
              size: 20
            ),
            tooltip: "Toggle Dark Mode",
            onPressed: () {
              themeNotifier.value = themeNotifier.value == ThemeMode.light 
                  ? ThemeMode.dark 
                  : ThemeMode.light;
            },
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bell, color: Colors.white, size: 20),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.gear, color: Colors.white, size: 20),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          
          // Profile
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16,
              child: Text("A", style: TextStyle(color: Color(0xFFFF6B6B), fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class _LeftNavigation extends StatelessWidget {
  final bool isCollapsed;
  final String activeItem;
  final VoidCallback? onToggleSidebar; // Added

  const _LeftNavigation({
    required this.isCollapsed, 
    required this.activeItem,
    this.onToggleSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isCollapsed ? 80 : 260,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // Dynamic
        border: Border(right: BorderSide(color: Theme.of(context).dividerColor)), // Dynamic
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          
          if (!isCollapsed)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text("MENU", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            
          _NavItem(
            icon: FontAwesomeIcons.house, 
            label: "Dashboard", 
            isActive: activeItem == "Dashboard",
            isCollapsed: isCollapsed,
            onTap: () {
              if (activeItem != "Dashboard") {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const DashboardScreen()),
                );
              }
            }, 
          ),
          _NavItem(
            icon: FontAwesomeIcons.inbox, 
            label: "Drafts", 
            count: 3,
            isActive: activeItem == "Drafts",
            isCollapsed: isCollapsed,
            onTap: () {
              if (activeItem != "Drafts") {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const DraftsListScreen()),
                );
              }
            },
          ),
          
          const SizedBox(height: 24),
          if (!isCollapsed)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text("PROFILES", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            
          _NavItem(icon: FontAwesomeIcons.user, label: "Alex (Me)", isActive: false, isCollapsed: isCollapsed, onTap: () {}),
          _NavItem(icon: FontAwesomeIcons.child, label: "Alice", isActive: false, isCollapsed: isCollapsed, onTap: () {}),
          _NavItem(icon: FontAwesomeIcons.child, label: "Bob", isActive: false, isCollapsed: isCollapsed, onTap: () {}),

          const Spacer(), // Push toggle to bottom

          // Sidebar Toggle Button
          if (onToggleSidebar != null)
            InkWell(
              onTap: onToggleSidebar,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade100)),
                ),
                child: Row(
                  mainAxisAlignment: isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
                  children: [
                    if (!isCollapsed) const SizedBox(width: 24),
                    Icon(
                      isCollapsed ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                      color: Colors.grey[600],
                    ),
                    if (!isCollapsed) ...[
                      const SizedBox(width: 16),
                      Text(
                        "Collapse Sidebar",
                        style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool isCollapsed;
  final int? count;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon, 
    required this.label, 
    required this.isActive, 
    required this.isCollapsed,
    this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final inactiveColor = Theme.of(context).iconTheme.color ?? Colors.grey;
    final textColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey[700];

    if (isCollapsed) {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          alignment: Alignment.center,
          decoration: isActive ? BoxDecoration(
            border: Border(left: BorderSide(color: primaryColor, width: 4)),
            color: primaryColor.withOpacity(0.05),
          ) : null,
          child: FaIcon(
            icon, 
            size: 20, 
            color: isActive ? primaryColor : inactiveColor,
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: isActive ? BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ) : null,
      child: ListTile(
        leading: FaIcon(
          icon, 
          size: 18, 
          color: isActive ? primaryColor : inactiveColor,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isActive ? primaryColor : textColor,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 15,
          ),
        ),
        trailing: count != null ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            count.toString(),
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ) : null,
        onTap: onTap,
        dense: true,
      ),
    );
  }
}
