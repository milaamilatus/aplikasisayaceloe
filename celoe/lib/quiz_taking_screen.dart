import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizTakingScreen extends StatefulWidget {
  const QuizTakingScreen({super.key});

  @override
  State<QuizTakingScreen> createState() => _QuizTakingScreenState();
}

class _QuizTakingScreenState extends State<QuizTakingScreen> {
  int _currentQuestion = 2; // Following the HTML design
  int _selectedOptionIndex = 2; // Option C (0-indexed: 2)
  final int _totalQuestions = 15;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryRed = const Color(0xFFC05052);
    final successColor = const Color(0xFF32CD32);
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF8F8F8);
    final textMainColor = isDark ? const Color(0xFFE0E0E0) : const Color(0xFF333333);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(primaryRed),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Grid
                      Center(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: List.generate(_totalQuestions, (index) {
                            int number = index + 1;
                            bool isCompleted = number == 1; // Example status
                            bool isCurrent = number == _currentQuestion;
                            return _buildQuestionNumberIndicator(number, isCompleted, isCurrent, isDark, primaryRed, successColor);
                          }),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Question Header
                      Row(
                        children: [
                          Text(
                            'Soal Nomor $_currentQuestion',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : const Color(0xFF111827),
                            ),
                          ),
                          Text(
                            ' / $_totalQuestions',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Question Text
                      Text(
                        'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isDark ? const Color(0xFFD1D5DB) : const Color(0xFF374151),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Options
                      _buildOption('A.', 'Intergrasi', 0, primaryRed, cardColor, isDark),
                      const SizedBox(height: 16),
                      _buildOption('B.', 'Standarisasi', 1, primaryRed, cardColor, isDark),
                      const SizedBox(height: 16),
                      _buildOption('C.', 'Konsistensi', 2, primaryRed, cardColor, isDark),
                      const SizedBox(height: 16),
                      _buildOption('D.', 'Koefensi', 3, primaryRed, cardColor, isDark),
                      const SizedBox(height: 16),
                      _buildOption('E.', 'Koneksi', 4, primaryRed, cardColor, isDark),
                      
                      const SizedBox(height: 120), // Spacer for bottom bar
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
            child: _buildBottomNav(isDark, cardColor),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(Color primaryRed) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 24, bottom: 24, left: 24, right: 24),
      decoration: BoxDecoration(
        color: primaryRed,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 48), // Spacer
          Text(
            'Quiz Review 1',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.alarm_rounded, color: Colors.white, size: 24),
              const SizedBox(width: 8),
              Text(
                '15 : 00',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionNumberIndicator(int number, bool isCompleted, bool isCurrent, bool isDark, Color primaryRed, Color successColor) {
    BoxDecoration decoration;
    TextStyle textStyle;

    if (isCompleted) {
      decoration = BoxDecoration(
        color: successColor,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
      );
      textStyle = GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);
    } else if (isCurrent) {
      decoration = BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[400]!, width: 2),
      );
      textStyle = GoogleFonts.poppins(color: isDark ? Colors.white : const Color(0xFF374151), fontWeight: FontWeight.bold, fontSize: 12);
    } else {
      decoration = BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: isDark ? Colors.grey[600]! : Colors.grey[300]!, width: 1),
      );
      textStyle = GoogleFonts.poppins(color: isDark ? Colors.grey[400] : Colors.grey[500], fontWeight: FontWeight.w500, fontSize: 12);
    }

    return Container(
      width: 32,
      height: 32,
      decoration: decoration,
      child: Center(child: Text('$number', style: textStyle)),
    );
  }

  Widget _buildOption(String letter, String text, int index, Color primaryRed, Color cardColor, bool isDark) {
    bool isSelected = _selectedOptionIndex == index;
    
    return GestureDetector(
      onTap: () => setState(() => _selectedOptionIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? primaryRed : cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected ? [
            BoxShadow(
              color: primaryRed.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ] : null,
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
        ),
        transform: isSelected ? (Matrix4.identity()..scale(1.02, 1.02)) : Matrix4.identity(),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              child: Text(
                letter,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  color: isSelected ? Colors.white.withOpacity(0.9) : (isDark ? Colors.grey[400] : Colors.grey[600]),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Colors.white : (isDark ? Colors.grey[200] : const Color(0xFF374151)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(bool isDark, Color cardColor) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: (isDark ? Colors.black : Colors.white).withOpacity(0.8),
            border: Border(top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavButton(
                icon: Icons.chevron_left_rounded,
                label: 'Soal Sebelum nya.',
                onPressed: () {},
                isDark: isDark,
                cardColor: cardColor,
              ),
              _buildNavButton(
                icon: Icons.chevron_right_rounded,
                label: 'Soal Selanjutnya.',
                onPressed: () {},
                isDark: isDark,
                cardColor: cardColor,
                isTrailingIcon: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required bool isDark,
    required Color cardColor,
    bool isTrailingIcon = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: cardColor,
        foregroundColor: isDark ? Colors.grey[300] : Colors.grey[700],
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isTrailingIcon) ...[
            Icon(icon, size: 20),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          if (isTrailingIcon) ...[
            const SizedBox(width: 4),
            Icon(icon, size: 20),
          ],
        ],
      ),
    );
  }
}
