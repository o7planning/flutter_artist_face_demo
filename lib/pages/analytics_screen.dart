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
              color: effectiveStyle.sidebarStyle.itemTextColor,
            ),
          ),
          const SizedBox(height: 20),

          // Layout updates conditionally based on screen size constraints
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
      color: style.sidebarStyle.backgroundColor.withValues(alpha: 0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weekly Framework Usage Metric',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: style.sidebarStyle.itemTextColor,
              ),
            ),
            const SizedBox(height: 40),
            // Mocking a professional bar chart representation using basic containers
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBar(
                    40,
                    'Mon',
                    style.sidebarStyle.groupTitleStyle.color!,
                  ),
                  _buildBar(
                    70,
                    'Tue',
                    style.sidebarStyle.groupTitleStyle.color!,
                  ),
                  _buildBar(
                    110,
                    'Wed',
                    style.sidebarStyle.groupTitleStyle.color!,
                  ),
                  _buildBar(
                    90,
                    'Thu',
                    style.sidebarStyle.groupTitleStyle.color!,
                  ),
                  _buildBar(
                    150,
                    'Fri',
                    style.sidebarStyle.groupTitleStyle.color!,
                  ),
                  _buildBar(
                    130,
                    'Sat',
                    style.sidebarStyle.groupTitleStyle.color!,
                  ),
                  _buildBar(
                    170,
                    'Sun',
                    style.sidebarStyle.groupTitleStyle.color!,
                  ),
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
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  Widget _buildRecentActivityList(FaceStyle style) {
    return Card(
      elevation: 0,
      color: style.sidebarStyle.backgroundColor.withValues(alpha: 0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live Events Log',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: style.sidebarStyle.itemTextColor,
              ),
            ),
            const SizedBox(height: 12),
            _buildLogTile(
              'Route changing triggered',
              '2 mins ago',
              Icons.alt_route_rounded,
              style,
            ),
            const Divider(height: 1, color: Colors.black12),
            _buildLogTile(
              'FaceStyle engine re-seeded',
              '15 mins ago',
              Icons.palette_outlined,
              style,
            ),
            const Divider(height: 1, color: Colors.black12),
            _buildLogTile(
              'Sidebar toggled by user',
              '1 hour ago',
              Icons.menu_open_rounded,
              style,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogTile(
    String title,
    String time,
    IconData icon,
    FaceStyle style,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: style.sidebarStyle.itemTextColor.withValues(alpha: 0.5),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: style.sidebarStyle.itemTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}
