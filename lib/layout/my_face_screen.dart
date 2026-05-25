import 'package:flutter/material.dart';
import 'package:flutter_artist_face/flutter_artist_face.dart';

import '../menu/menu_model.dart';

abstract class MyFaceScreen extends FaceScreen {
  final String currentRoute;

  const MyFaceScreen({super.key, required this.currentRoute});

  @override
  FaceStyle buildStyle(BuildContext context) {
    const Color navyBaseDarkSidebar = Color(0xFF1E2541);
    const Color navyBaseDarkTopbar = Color(0xFF1E2531);
    const Color navyBorderColor = Color(0xFF2E375E);
    const Color electricActive = Color(0xFF4361EE);

    return const FaceStyle(
      scaffoldBackground: Color(0xFFF4F6FA),
      topbarStyle: TopbarStyle(
        backgroundColor: navyBaseDarkTopbar,
        iconColor: Colors.white, // Pure white-silver crisp action icons
        textColor: Colors.white, // Crisp bold title display
      ),

      sidebarStyle: SidebarStyle(
        backgroundColor: navyBaseDarkSidebar,
        expandedWidth: 240,
        collapsedWidth: 60,
        groupPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        groupTitleStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 11,
          color: Color(
            0xFF94A3B8,
          ), // Slate gray-blue text for non-intrusive section titles
          letterSpacing: 1.1,
        ),
        groupSubtitleStyle: TextStyle(color: Color(0xFF64748B), fontSize: 10),
        itemPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        itemBorderRadius: 8.0,
        itemIconColor: Color(0xFF94A3B8),
        // Soft muted icons when unselected
        itemTextColor: Color(0xFFE2E8F0),
        // Off-white readable text labels
        // Interaction feedback states inside the dark panel
        itemHoverColor: Color(0x13FFFFFF),
        // Elegant translucent ghost overlay
        itemSelectedColor: Color(
          0xFF2F3860,
        ), // Solid visible matching block for active routes
      ),
    );
  }

  @override
  List<SidebarMenuGroupModel> buildSidebarMenuGroupModels(
    BuildContext context,
  ) {
    return getMenuGroups(currentRoute);
  }

  @override
  SidebarMenuItemModel? buildConfigurationMenuItemModel(BuildContext context) {
    // Optional item at the bottom of the sidebar menu
    return SidebarMenuItemModel(
      code: 'logout',
      iconData: Icons.logout_rounded,
      menuTitle: 'Logout',
      route: '/logout',
    );
  }

  @override
  Widget buildTopMenuLeading({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    return Text(
      'FlutterArtist Face',
      style: TextStyle(
        color: effectiveStyle.topbarStyle.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget buildTopMenuCenter({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    return const SizedBox.shrink(); // Left empty or can be used for search bars
  }

  @override
  Widget buildTopMenuTrailing({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TopMenuItemButton(
          icon: Icon(
            Icons.notifications_none,
            color: effectiveStyle.topbarStyle.iconColor,
            size: 20,
          ),
          notificationValue: 3,
          onTap: () {},
        ),
        const SizedBox(width: 10),
        TopMenuItemButton(
          icon: Icon(
            Icons.wb_sunny_outlined,
            color: effectiveStyle.topbarStyle.iconColor,
            size: 20,
          ),
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget buildSidebarExpandedLogo({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    return Row(
      children: [
        Icon(
          Icons.palette_rounded,
          color: effectiveStyle.sidebarStyle.groupTitleStyle.color,
        ),
        const SizedBox(width: 10),
        Text(
          'ARTIST STUDIO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: effectiveStyle.sidebarStyle.groupTitleStyle.color,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildSidebarCollapsedLogo({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    return Center(
      child: Icon(
        Icons.palette_rounded,
        color: effectiveStyle.sidebarStyle.groupTitleStyle.color,
      ),
    );
  }

  @override
  Widget buildSidebarExpandedProfile({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: effectiveStyle.sidebarStyle.itemHoverColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: effectiveStyle.sidebarStyle.groupTitleStyle.color,
            child: const Text(
              'FA',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Developer One',
                  style: TextStyle(
                    color: effectiveStyle.sidebarStyle.itemTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'admin@artist.dev',
                  style: TextStyle(
                    color: effectiveStyle.sidebarStyle.itemTextColor.withValues(
                      alpha: 0.6,
                    ),
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSidebarCollapsedProfile({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: effectiveStyle.sidebarStyle.groupTitleStyle.color,
        child: const Text(
          'FA',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }

  @override
  Widget? buildFooter({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: const Text(
        '© 2026 FlutterArtist Ecosystem',
        style: TextStyle(fontSize: 11, color: Colors.grey),
      ),
    );
  }

  @override
  Widget? buildEndDrawer({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) => null;

  @override
  void onNavigateTo(BuildContext context, String route) {
    // Centralized route router redirector implementation
    Navigator.of(context).pushReplacementNamed(route);
  }
}
