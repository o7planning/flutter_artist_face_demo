import 'package:flutter/material.dart';
import 'package:flutter_artist_face/flutter_artist_face.dart';

import '../layout/my_face_screen.dart';

class DashboardScreen extends MyFaceScreen {
  const DashboardScreen({super.key}) : super(currentRoute: '/dashboard');

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
            'Welcome back, Artist!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: effectiveStyle.sidebarStyle.itemTextColor,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildDemoCard(
                  'Total Widgets',
                  '142',
                  Icons.widgets_outlined,
                  effectiveStyle,
                ),
                _buildDemoCard(
                  'Active Users',
                  '1,204',
                  Icons.people_alt_outlined,
                  effectiveStyle,
                ),
                _buildDemoCard(
                  'Performance Rate',
                  '99.8%',
                  Icons.speed_rounded,
                  effectiveStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoCard(
    String title,
    String value,
    IconData icon,
    FaceStyle style,
  ) {
    return Card(
      elevation: 0,
      color: style.sidebarStyle.backgroundColor.withAlpha(
        (255.0 * 0.5).round(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: style.sidebarStyle.groupTitleStyle.color,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: style.sidebarStyle.itemTextColor.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: style.sidebarStyle.itemTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
