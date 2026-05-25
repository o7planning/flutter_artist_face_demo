import 'package:flutter/material.dart';
import 'package:flutter_artist_face/flutter_artist_face.dart';

import '../layout/my_face_screen.dart';

class AnalyticsScreen extends MyFaceScreen {
  const AnalyticsScreen({super.key}) : super(currentRoute: '/analytics');

  @override
  Widget buildBody({
    required BuildContext context,
    required FaceStyle effectiveStyle,
  }) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analytics Overview',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // Using a deep slate color for modern readable dark typography on light background
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 20),

          // Layout dynamically switches based on screen width breakpoints
          Expanded(
            child: ListView(
              children: [
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildChartPlaceholder(effectiveStyle),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: _buildRecentActivityList(effectiveStyle),
                      ),
                    ],
                  )
                else ...[
                  _buildChartPlaceholder(effectiveStyle),
                  const SizedBox(height: 16),
                  _buildRecentActivityList(effectiveStyle),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartPlaceholder(FaceStyle style) {
    return Card(
      elevation: 0,
      color: Colors.white,
      // Crisp white card standing out on the soft slate background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFFE2E8F0),
        ), // Subtle premium light border
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Framework Usage Metric',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 40),
            // Mocking a responsive bar chart presentation using standard container bars
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBar(40, 'Mon', const Color(0xFF4361EE)),
                  _buildBar(70, 'Tue', const Color(0xFF4361EE)),
                  _buildBar(110, 'Wed', const Color(0xFF4361EE)),
                  _buildBar(90, 'Thu', const Color(0xFF4361EE)),
                  _buildBar(150, 'Fri', const Color(0xFF4361EE)),
                  _buildBar(130, 'Sat', const Color(0xFF4361EE)),
                  _buildBar(170, 'Sun', const Color(0xFF4361EE)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(double height, String label, Color barColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 24,
          height: height,
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
        ),
      ],
    );
  }

  Widget _buildRecentActivityList(FaceStyle style) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Live Events Log',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            _buildLogTile(
              'Route changing triggered',
              '2 mins ago',
              Icons.alt_route_rounded,
            ),
            const Divider(height: 1, color: Color(0xFFF1F5F9)),
            _buildLogTile(
              'FaceStyle engine re-seeded',
              '15 mins ago',
              Icons.palette_outlined,
            ),
            const Divider(height: 1, color: Color(0xFFF1F5F9)),
            _buildLogTile(
              'Sidebar toggled by user',
              '1 hour ago',
              Icons.menu_open_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogTile(String title, String time, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF64748B)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }
}
