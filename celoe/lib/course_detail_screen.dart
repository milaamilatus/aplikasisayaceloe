import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'material_detail_screen.dart';
import 'my_classes_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _selectedTabIndex = 0; // 0 for Materi, 1 for Tugas Dan Kuis

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF111827) : const Color(0xFFF3F4F6);
    final cardColor = isDark ? const Color(0xFF1F2937) : Colors.white;
    final textMainColor = isDark ? Colors.white : const Color(0xFF1F2937);
    final primaryColor = const Color(0xFFB94B4B);
    final blueTagColor = const Color(0xFF5DAEEB);
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
              padding: const EdgeInsets.only(top: 60, bottom: 40, left: 16, right: 16),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Tab Switcher
            Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      _buildTabItem('Materi', 0, cardColor, textMainColor),
                      _buildTabItem('Tugas Dan Kuis', 1, cardColor, textMainColor),
                    ],
                  ),
                ),
              ),
            ),

            // Content List
            Expanded(
              child: _selectedTabIndex == 0 
                ? _buildMateriContent(cardColor, textMainColor, blueTagColor, greenCheckColor)
                : _buildTugasKuisContent(cardColor, textMainColor, blueTagColor, greenCheckColor, isDark),
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
              color: Colors.black.withOpacity(0.15),
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

  Widget _buildTabItem(String label, int index, Color cardColor, Color textMainColor) {
    bool isActive = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                  color: isActive ? textMainColor : Colors.grey[400],
                ),
              ),
              if (isActive) ...[
                const SizedBox(height: 4),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : const Color(0xFF1F2937),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMateriContent(Color cardColor, Color textMainColor, Color blueTagColor, Color greenCheckColor) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MaterialDetailScreen()),
            );
          },
          child: _buildModuleItem(
            tag: 'Pertemuan 1',
            title: '01 - Pengantar User Interface Design',
            metadata: '3 URLs, 2 Files, 3 Interactive Content',
            isCompleted: false,
            cardColor: cardColor,
            textMainColor: textMainColor,
            blueTagColor: blueTagColor,
            greenCheckColor: greenCheckColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MaterialDetailScreen()),
            );
          },
          child: _buildModuleItem(
            tag: 'Pertemuan 2',
            title: '02 - Konsep User Interface Design',
            metadata: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
            isCompleted: true,
            cardColor: cardColor,
            textMainColor: textMainColor,
            blueTagColor: blueTagColor,
            greenCheckColor: greenCheckColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MaterialDetailScreen()),
            );
          },
          child: _buildModuleItem(
            tag: 'Pertemuan 3',
            title: '03 - Interaksi pada User Interface Design',
            metadata: '3 URLs, 2 Files, 3 Interactive Content',
            isCompleted: true,
            cardColor: cardColor,
            textMainColor: textMainColor,
            blueTagColor: blueTagColor,
            greenCheckColor: greenCheckColor,
          ),
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
    );
  }

  Widget _buildTugasKuisContent(Color cardColor, Color textMainColor, Color blueTagColor, Color greenCheckColor, bool isDark) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      children: [
        _buildTugasKuisItem(
          tag: 'Quiz',
          title: 'Quiz Review 01',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          isCompleted: true,
          isQuiz: true,
          cardColor: cardColor,
          textMainColor: textMainColor,
          blueTagColor: blueTagColor,
          greenCheckColor: greenCheckColor,
          isDark: isDark,
        ),
        _buildTugasKuisItem(
          tag: 'Tugas',
          title: 'Tugas 01 - UID Android Mobile Game',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          isCompleted: false,
          isQuiz: false,
          cardColor: cardColor,
          textMainColor: textMainColor,
          blueTagColor: blueTagColor,
          greenCheckColor: greenCheckColor,
          isDark: isDark,
        ),
        _buildTugasKuisItem(
          tag: 'Pertemuan 3',
          title: 'Kuis - Assessment 2',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          isCompleted: true,
          isQuiz: true,
          cardColor: cardColor,
          textMainColor: textMainColor,
          blueTagColor: blueTagColor,
          greenCheckColor: greenCheckColor,
          isDark: isDark,
        ),
        const SizedBox(height: 80),
      ],
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
            color: Colors.black.withOpacity(0.05),
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
                  borderRadius: BorderRadius.circular(8),
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

  Widget _buildTugasKuisItem({
    required String tag,
    required String title,
    required String deadline,
    required bool isCompleted,
    required bool isQuiz,
    required Color cardColor,
    required Color textMainColor,
    required Color blueTagColor,
    required Color greenCheckColor,
    required bool isDark,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: blueTagColor,
                  borderRadius: BorderRadius.circular(8),
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
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isCompleted 
                      ? (isDark ? Colors.green.withOpacity(0.2) : Colors.green[50])
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isCompleted ? Icons.check_circle_rounded : Icons.watch_later_rounded,
                  color: isCompleted ? greenCheckColor : Colors.grey[400],
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              if (isQuiz)
                _buildQuizIcon(isDark)
              else
                Icon(
                  Icons.assignment_rounded,
                  size: 48,
                  color: isDark ? Colors.white : const Color(0xFF1F2937),
                ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textMainColor,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            deadline,
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

  Widget _buildQuizIcon(bool isDark) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: 48,
            color: isDark ? Colors.white : const Color(0xFF1F2937),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Quiz',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: isDark ? Colors.white : const Color(0xFF1F2937),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
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
