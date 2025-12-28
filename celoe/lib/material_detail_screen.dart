import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assignment_detail_screen.dart';

import 'material_content_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';
import 'my_classes_screen.dart';

class MaterialDetailScreen extends StatefulWidget {
  const MaterialDetailScreen({super.key});

  @override
  State<MaterialDetailScreen> createState() => _MaterialDetailScreenState();
}

class _MaterialDetailScreenState extends State<MaterialDetailScreen> {
  int _selectedTabIndex = 0; // 0 for Lampiran Materi, 1 for Tugas dan Kuis

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF111827) : Colors.white;
    final surfaceColor = isDark ? const Color(0xFF1F2937) : const Color(0xFFF9FAFB);
    final textMainColor = isDark ? const Color(0xFFF3F4F6) : const Color(0xFF111827);
    final textSubColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563);
    final primaryGreen = const Color(0xFF22C55E);

    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xFFF3F4F6),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 448),
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  // Drag Handle & Title
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Center(
                          child: Container(
                            width: 48,
                            height: 6,
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            'Konsep User Interface Design',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: textMainColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),

                  // Description
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deskripsi',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: textMainColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari interaction.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: textSubColor,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),

                  // Sticky Tabs
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      child: Container(
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          border: Border(
                            top: BorderSide(color: isDark ? const Color(0xFF1F2937) : const Color(0xFFF3F4F6)),
                            bottom: BorderSide(color: isDark ? const Color(0xFF1F2937) : const Color(0xFFF3F4F6)),
                          ),
                        ),
                        child: Row(
                          children: [
                            _buildTabItem('Lampiran Materi', 0, textMainColor, isDark),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                color: backgroundColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    children: [
                      _buildMaterialItem(
                        icon: Icons.link_rounded,
                        title: 'Zoom Meeting Syncronous',
                        isCompleted: true,
                        textMainColor: textMainColor,
                        isDark: isDark,
                      ),
                      _buildMaterialItem(
                        icon: Icons.folder_open_rounded,
                        title: 'Materi 01 - Pengenalan UID',
                        isCompleted: true,
                        textMainColor: textMainColor,
                        isDark: isDark,
                      ),
                      _buildMaterialItem(
                        icon: Icons.folder_open_rounded,
                        title: 'Materi 01 (Part 2) - Interaction Design',
                        isCompleted: true,
                        textMainColor: textMainColor,
                        isDark: isDark,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTabItem(String title, int index, Color textMainColor, bool isDark) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? const Color(0xFFA63434) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? const Color(0xFFA63434) : (isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialItem({
    required IconData icon,
    required String title,
    required bool isCompleted,
    required Color textMainColor,
    required bool isDark,
  }) {
    final cardColor = isDark ? const Color(0xFF1F2937) : Colors.white;
    final dividerColor = isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB);
    // ignore: unused_local_variable
    final primaryRed = const Color(0xFFA63434);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MaterialContentScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1F2937).withOpacity(0.5) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 64,
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB))),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                    size: 28,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: textMainColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        isCompleted ? Icons.check_circle : Icons.circle_outlined,
                        color: isCompleted ? const Color(0xFF22C55E) : (isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB)),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  Widget _buildBottomNav() {
    return Container(
      height: 95,
      padding: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
      decoration: const BoxDecoration(
        color: Color(0xFFB2544F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_rounded, 'Home', false),
          _buildNavItem(Icons.school_rounded, 'Kelas Saya', true),
          _buildNavItem(Icons.notifications_rounded, 'Notifikasi', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else if (label == 'Kelas Saya' && !isActive) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyClassesScreen()),
          );
        } else if (label == 'Notifikasi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotificationScreen()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 50.0;
  @override
  double get maxExtent => 50.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
