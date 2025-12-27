import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF121212) : const Color(0xFFF0F2F5);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textMainColor = isDark ? const Color(0xFFE0E0E0) : const Color(0xFF1F2937);
    final primaryColor = const Color(0xFFB94343);
    final blueTagColor = const Color(0xFF5D9CEC);
    final greenCheckColor = const Color(0xFF2ECC71);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, bottom: 24, left: 16, right: 16),
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Tab Switcher
            Transform.translate(
              offset: const Offset(0, -12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Materi',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: textMainColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: 32,
                              height: 4,
                              decoration: BoxDecoration(
                                color: textMainColor,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Tugas Dan Kuis',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Content List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  _buildModuleItem(
                    tag: 'Pertemuan 1',
                    title: '01 - Pengantar User Interface Design',
                    metadata: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: false,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    blueTagColor: blueTagColor,
                    greenCheckColor: greenCheckColor,
                  ),
                  _buildModuleItem(
                    tag: 'Pertemuan 2',
                    title: '02 - Konsep User Interface Design',
                    metadata: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
                    isCompleted: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    blueTagColor: blueTagColor,
                    greenCheckColor: greenCheckColor,
                  ),
                  _buildModuleItem(
                    tag: 'Pertemuan 3',
                    title: '03 - Interaksi pada User Interface Design',
                    metadata: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    blueTagColor: blueTagColor,
                    greenCheckColor: greenCheckColor,
                  ),
                  _buildModuleItem(
                    tag: 'Pertemuan 4',
                    title: '04 - Ethnographic Observation',
                    metadata: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    blueTagColor: blueTagColor,
                    greenCheckColor: greenCheckColor,
                  ),
                  _buildModuleItem(
                    tag: 'Pertemuan 5',
                    title: '05 - UID Testing',
                    metadata: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    blueTagColor: blueTagColor,
                    greenCheckColor: greenCheckColor,
                  ),
                  _buildModuleItem(
                    tag: 'Pertemuan 6',
                    title: '06 - Assessment I',
                    metadata: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    blueTagColor: blueTagColor,
                    greenCheckColor: greenCheckColor,
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 95,
        padding: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavItem(Icons.home_rounded, 'Home', false),
            _buildNavItem(Icons.school_rounded, 'Kelas Saya', true),
            _buildNavItem(Icons.notifications_rounded, 'Notifikasi', false),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleItem({
    required String tag,
    required String title,
    required String metadata,
    required bool isCompleted,
    required Color cardColor,
    required Color textMainColor,
    required Color blueTagColor,
    required Color greenCheckColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: blueTagColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tag.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Icon(
                Icons.check_circle_rounded,
                color: isCompleted ? greenCheckColor : Colors.grey[300],
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textMainColor,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            metadata,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
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
    );
  }
}
