import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'announcement_detail_screen.dart';
import 'my_classes_screen.dart';
import 'notification_screen.dart';
import 'home_screen.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF18181B) : Colors.white;
    final surfaceColor = isDark ? const Color(0xFF27272A) : const Color(0xFFF3F4F6);
    final textMainColor = isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937);
    final textSubColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
    const primaryColor = Color(0xFFB94B4B);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: textMainColor,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Pengumuman',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Divider
                Container(
                  height: 8,
                  width: double.infinity,
                  color: isDark ? const Color(0xFF27272A) : const Color(0xFFF3F4F6),
                ),

                // Announcement List
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AnnouncementDetailScreen()),
                            );
                          },
                          child: _buildAnnouncementItem(
                            title: 'Maintenance Pra UAS Semester Genap 2025/2026',
                            author: 'Admin Celoe',
                            date: 'Sabtu, 27 Desember 2025, 10:45',
                            textMainColor: textMainColor,
                            textSubColor: textSubColor,
                            isDark: isDark,
                          ),
                        ),
                        _buildAnnouncementItem(
                          title: 'Pengumuman Maintance',
                          author: 'Admin Celoe',
                          date: 'Sabtu, 27 Desember 2025, 7:52',
                          textMainColor: textMainColor,
                          textSubColor: textSubColor,
                          isDark: isDark,
                        ),
                        _buildAnnouncementItem(
                          title: 'Maintenance Pra UAS Semester Ganjil 2025/2026',
                          author: 'Admin Celoe',
                          date: 'Sabtu, 27 Desember 2025, 9:30',
                          textMainColor: textMainColor,
                          textSubColor: textSubColor,
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Bottom Navigation Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 95,
                padding: const EdgeInsets.only(bottom: 10, top: 10, left: 24, right: 24),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 15, offset: Offset(0, -5)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(context, Icons.home_rounded, 'Home', false),
                    _buildNavItem(context, Icons.school_rounded, 'Kelas Saya', false),
                    _buildNavItem(context, Icons.notifications_rounded, 'Notifikasi', false, hasNotification: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementItem({
    required String title,
    required String author,
    required String date,
    required Color textMainColor,
    required Color textSubColor,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.rotate(
            angle: -12 * math.pi / 180,
            child: Icon(
              Icons.campaign_rounded,
              size: 32,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textMainColor,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'By $author • $date',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: textSubColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, bool isActive, {bool hasNotification = false}) {
    return GestureDetector(
      onTap: () {
        if (label == 'Kelas Saya' && !isActive) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyClassesScreen()),
          );
        } else if (label == 'Notifikasi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotificationScreen()),
          );
        } else if (label == 'Home' && !isActive) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 34,
              ),
              if (hasNotification)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFB94B4B), width: 1.5),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
