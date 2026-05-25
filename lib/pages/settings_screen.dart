import 'package:flutter/material.dart';
import 'package:flutter_artist_face/flutter_artist_face.dart';

import '../layout/my_face_screen.dart';

class SettingsScreen extends MyFaceScreen {
  const SettingsScreen({super.key}) : super(currentRoute: '/settings');

  @override
  Widget buildBody({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'System Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // Crisp dark slate color for high-end modern layout contrast
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 24),

          // Settings block container wrapped inside a beautiful structural card
          Card(
            elevation: 0,
            color: Colors.white,
            // Pop out clean white surface on the soft slate background
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xFFE2E8F0),
              ), // Subtle premium outline border
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.palette_outlined,
                    color: Color(0xFF4361EE),
                  ),
                  title: const Text(
                    'Theme Configuration',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  subtitle: const Text(
                    'Change layout behavior, custom adapters and navy styling presets',
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF94A3B8),
                  ),
                  onTap: () {},
                ),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                ListTile(
                  leading: const Icon(
                    Icons.phonelink_setup_rounded,
                    color: Color(0xFF4361EE),
                  ),
                  title: const Text(
                    'Responsive Engine',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  subtitle: const Text(
                    'Configure default breakpoint layouts for mobile, tablet, and web views',
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF94A3B8),
                  ),
                  onTap: () {},
                ),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                ListTile(
                  leading: const Icon(
                    Icons.security_outlined,
                    color: Color(0xFF4361EE),
                  ),
                  title: const Text(
                    'Framework Access Permissions',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  subtitle: const Text(
                    'Manage security tokens, projection bindings and authentication keys',
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF94A3B8),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
