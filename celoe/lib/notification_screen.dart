import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_classes_screen.dart';
import 'home_screen.dart';
import 'announcement_screen.dart';
import 'announcement_detail_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF111827) : Colors.white;
    final textMainColor = isDark ? const Color(0xFFF9FAFB) : const Color(0xFF1F2937);
    final borderColor = isDark ? Colors.grey[800] : Colors.grey[200];
    final primaryRed = const Color(0xFFAA3A3A);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
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

            // Tab Bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1F2937) : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: primaryRed,
                  borderRadius: BorderRadius.circular(10),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: isDark ? Colors.grey[400] : Colors.grey[600],
                labelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 13),
                tabs: const [
                  Tab(text: 'Semua'),
                  Tab(text: 'Pengumuman'),
                ],
              ),
            ),

            // Tab Bar View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildNotificationTab(isDark, textMainColor, borderColor!),
                  _buildAnnouncementTab(isDark, textMainColor, borderColor),
                ],
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
                  _buildNavItem(Icons.home_outlined, 'Home', false, isDark, context),
                  _buildNavItem(Icons.school_outlined, 'Kelas Saya', false, isDark, context),
                  _buildNavItem(Icons.notifications_rounded, 'Notifikasi', true, isDark, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTab(bool isDark, Color textMainColor, Color borderColor) {
    final textSubColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
    return SingleChildScrollView(
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
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementTab(bool isDark, Color textMainColor, Color borderColor) {
    final textSubColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildAnnouncementItem(
            title: 'Maintenance Pro EAS Semester Genap 2025/2026',
            date: '27 Des 2025',
            isDark: isDark,
            textMainColor: textMainColor,
            textSubColor: textSubColor,
            borderColor: borderColor,
          ),
          _buildAnnouncementItem(
            title: 'Informasi Pelaksanaan Kuliah Daring Minggu 11-14',
            date: '27 Des 2025',
            isDark: isDark,
            textMainColor: textMainColor,
            textSubColor: textSubColor,
            borderColor: borderColor,
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementItem({
    required String title,
    required String date,
    required bool isDark,
    required Color textMainColor,
    required Color textSubColor,
    required Color borderColor,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnnouncementDetailScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1F2937).withOpacity(0.5) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFB94B4B).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.campaign_outlined, color: Color(0xFFB94B4B), size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: textMainColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: textSubColor,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Colors.grey),
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

  Widget _buildNavItem(IconData icon, String label, bool isActive, bool isDark, BuildContext context) {
    final activeColor = isDark ? Colors.white : const Color(0xFF111827);
    final inactiveColor = Colors.grey[400];

    return GestureDetector(
      onTap: () {
        if (label == 'Kelas Saya' && !isActive) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyClassesScreen()),
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
