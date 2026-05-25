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
          Text(
            'System Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: effectiveStyle.sidebarStyle.itemTextColor,
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: const Icon(Icons.palette_outlined),
                  title: const Text('Theme Configuration'),
                  subtitle: const Text(
                    'Change layout behavior and base colors',
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.phonelink_setup_rounded),
                  title: const Text('Responsive Engine Defaults'),
                  subtitle: const Text(
                    'Configure layout constraints breakpoints',
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
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
