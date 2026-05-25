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
          const Text(
            'Welcome back, Artist!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // Professional deep slate text color for perfect canvas contrast
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              // Handles screen layout responsiveness beautifully based on width constraints
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: MediaQuery.of(context).size.width > 1200
                  ? 1.3
                  : 1.1,
              children: [
                _buildDemoCard(
                  title: 'Total Widgets',
                  value: '142',
                  icon: Icons.widgets_outlined,
                ),
                _buildDemoCard(
                  title: 'Active Users',
                  value: '1,204',
                  icon: Icons.people_alt_outlined,
                ),
                _buildDemoCard(
                  title: 'Performance Rate',
                  value: '99.8%',
                  icon: Icons.speed_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      // Pure white surface to pop out elegantly on the light slate canvas
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFFE2E8F0),
        ), // Subtle high-quality border line
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Electric blue brand accent color for active indicators
            Icon(icon, size: 32, color: const Color(0xFF4361EE)),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: const Color(0xFF64748B), // Muted secondary text
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A), // Deep primary typography
              ),
            ),
          ],
        ),
      ),
    );
  }
}
