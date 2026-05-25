import 'package:flutter/material.dart';
import 'package:flutter_artist_face/flutter_artist_face.dart';

List<SidebarMenuGroupModel> getMenuGroups(String currentRoute) {
  return [
    SidebarMenuGroupModel(
      title: 'DASHBOARD',
      subtitle: 'Dashboard',
      showHeader: false,
      menus: [
        SidebarMenuItemModel(
          code: 'dashboard',
          iconData: Icons.dashboard_rounded,
          menuTitle: 'Dashboard',
          route: '/dashboard',
          isSelected: currentRoute == '/dashboard',
        ),
      ],
    ),
    SidebarMenuGroupModel(
      title: 'MAIN MENU',
      subtitle: 'Core application views',
      menus: [
        SidebarMenuItemModel(
          code: 'analytics',
          iconData: Icons.bar_chart_rounded,
          menuTitle: 'Analytics',
          route: '/analytics',
          notifyValue: 5,
          // Example notification badge
          isSelected: currentRoute == '/analytics',
        ),
      ],
    ),
    SidebarMenuGroupModel(
      title: 'MANAGEMENT',
      subtitle: 'System & Configuration',
      menus: [
        SidebarMenuItemModel(
          code: 'settings',
          iconData: Icons.settings_rounded,
          menuTitle: 'Settings',
          route: '/settings',
          isSelected: currentRoute == '/settings',
        ),
      ],
    ),
  ];
}
