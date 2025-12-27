import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_classes_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF111827) : Colors.white;
    final surfaceColor = isDark ? const Color(0xFF1F2937) : const Color(0xFFF3F4FB);
    final textMainColor = isDark ? const Color(0xFFF9FAFB) : const Color(0xFF1F2937);
    final textSubColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
    final borderColor = isDark ? Colors.grey[800] : Colors.grey[200];
    const primaryColor = Color(0xFF111827);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: textMainColor,
                        size: 30,
                      ),
                    ),
                  ),
                  Text(
                    'Notifikasi',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textMainColor,
                    ),
                  ),
                ],
              ),
            ),
            
            // Notification List
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    _buildNotificationItem(
                      icon: Icons.assignment_outlined,
                      message: 'Anda telah mengirimkan pengajuan tugas untuk ',
                      boldPart: 'Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
                      time: '3 Hari 9 Jam Yang Lalu',
                      isDark: isDark,
                      textMainColor: textMainColor,
                      textSubColor: textSubColor,
                      borderColor: borderColor!,
                      isLast: false,
                    ),
                    _buildNotificationItem(
                      icon: Icons.quiz_outlined,
                      message: 'Anda telah mengirimkan pengajuan tugas untuk ',
                      boldPart: 'Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
                      time: '3 Hari 9 Jam Yang Lalu',
                      isDark: isDark,
                      textMainColor: textMainColor,
                      textSubColor: textSubColor,
                      borderColor: borderColor,
                      isLast: false,
                    ),
                    _buildNotificationItem(
                      icon: Icons.assignment_outlined,
                      message: 'Anda telah mengirimkan pengajuan tugas untuk ',
                      boldPart: 'Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
                      time: '3 Hari 9 Jam Yang Lalu',
                      isDark: isDark,
                      textMainColor: textMainColor,
                      textSubColor: textSubColor,
                      borderColor: borderColor,
                      isLast: false,
                    ),
                    _buildNotificationItem(
                      icon: Icons.quiz_outlined,
                      message: 'Anda telah mengirimkan pengajuan tugas untuk ',
                      boldPart: 'Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
                      time: '3 Hari 9 Jam Yang Lalu',
                      isDark: isDark,
                      textMainColor: textMainColor,
                      textSubColor: textSubColor,
                      borderColor: borderColor,
                      isLast: false,
                    ),
                    _buildNotificationItem(
                      icon: Icons.assignment_outlined,
                      message: 'Anda telah mengirimkan pengajuan tugas untuk ',
                      boldPart: 'Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
                      time: '3 Hari 9 Jam Yang Lalu',
                      isDark: isDark,
                      textMainColor: textMainColor,
                      textSubColor: textSubColor,
                      borderColor: borderColor,
                      isLast: false,
                    ),
                    _buildNotificationItem(
                      icon: Icons.assignment_outlined,
                      message: 'Anda telah mengirimkan pengajuan tugas untuk ',
                      boldPart: 'Tugas Pendahuluan Modul 4',
                      time: '5 Hari 2 Jam Yang Lalu',
                      isDark: isDark,
                      textMainColor: textMainColor,
                      textSubColor: textSubColor,
                      borderColor: borderColor,
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Bar
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1F2937) : Colors.white,
                border: Border(
                  top: BorderSide(color: borderColor),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home_outlined, 'Home', false, isDark),
                  _buildNavItem(Icons.school_outlined, 'Kelas Saya', false, isDark),
                  _buildNavItem(Icons.notifications_rounded, 'Notifikasi', true, isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String message,
    required String boldPart,
    required String time,
    required bool isDark,
    required Color textMainColor,
    required Color textSubColor,
    required Color borderColor,
    required bool isLast,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1F2937) : const Color(0xFFF9FAFB),
              shape: BoxShape.circle,
              border: Border.all(color: borderColor),
            ),
            child: Icon(
              icon,
              size: 20,
              color: isDark ? Colors.grey[200] : Colors.grey[800],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              decoration: BoxDecoration(
                border: isLast ? null : Border(
                  bottom: BorderSide(color: borderColor),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: textMainColor,
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(text: message),
                        TextSpan(
                          text: boldPart,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: textSubColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, bool isDark) {
    final activeColor = isDark ? Colors.white : const Color(0xFF111827);
    final inactiveColor = Colors.grey[400];

    return GestureDetector(
      onTap: () {
        if (!isActive && label == 'Kelas Saya') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyClassesScreen()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? activeColor : inactiveColor,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              color: isActive ? activeColor : inactiveColor,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
