import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_answer_review_screen.dart';

class QuizTakingScreen extends StatefulWidget {
  const QuizTakingScreen({super.key});

  @override
  State<QuizTakingScreen> createState() => _QuizTakingScreenState();
}

class _QuizTakingScreenState extends State<QuizTakingScreen> {
  int _currentQuestion = 3; // Following the latest HTML design
  int _selectedOptionIndex = 2; // Option A is selected in HTML (A, B, C, D, E order is different in HTML though)
  final int _totalQuestions = 15;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryRed = const Color(0xFFB94A48);
    final primaryLightRed = const Color(0xFFE56B69);
    final successColor = const Color(0xFF39E728);
    final backgroundColor = isDark ? const Color(0xFF18181B) : Colors.white;
    final surfaceColor = isDark ? const Color(0xFF27272A) : const Color(0xFFF5F5F5);

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
                    children: [
                      // Question Grid
                      Center(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: List.generate(_totalQuestions, (index) {
                            int number = index + 1;
                            bool isCurrent = number == _currentQuestion;
                            bool isCompleted = number < 15; // Simulated state
                            return _buildQuestionIndicator(number, isCompleted, isCurrent, isDark, successColor, surfaceColor);
                          }),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Question Header
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              'Soal Nomor $_currentQuestion ',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : const Color(0xFF111827),
                              ),
                            ),
                            Text(
                              '/ 15',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Question Text
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                            height: 1.6,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Options
                      _buildOption('C.', 'Hobby', 0, surfaceColor, primaryLightRed, isDark),
                      const SizedBox(height: 16),
                      _buildOption('B.', 'Alamat', 1, surfaceColor, primaryLightRed, isDark),
                      const SizedBox(height: 16),
                      _buildOption('A.', 'Jenis Kelamin', 2, surfaceColor, primaryLightRed, isDark),
                      const SizedBox(height: 16),
                      _buildOption('D.', 'Riwayat Pendidikan', 3, surfaceColor, primaryLightRed, isDark),
                      const SizedBox(height: 16),
                      _buildOption('E.', 'Umur', 4, surfaceColor, primaryLightRed, isDark),
                      
                      const SizedBox(height: 140), // Spacer for bottom bar
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
            child: _buildBottomNav(isDark, successColor, surfaceColor),
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

  Widget _buildQuestionIndicator(int number, bool isCompleted, bool isCurrent, bool isDark, Color successColor, Color surfaceColor) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCompleted ? successColor : surfaceColor,
        border: isCurrent 
            ? Border.all(color: successColor, width: 2) 
            : (isCompleted ? null : Border.all(color: isDark ? Colors.grey[600]! : Colors.grey[400]!)),
        boxShadow: isCompleted ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2, offset: const Offset(0, 1))] : null,
      ),
      padding: isCurrent ? const EdgeInsets.all(2) : null,
      child: Container(
        decoration: isCurrent ? BoxDecoration(shape: BoxShape.circle, border: Border.all(color: isDark ? const Color(0xFF18181B) : Colors.white, width: 2), color: successColor) : null,
        child: Center(
          child: Text(
            '$number',
            style: GoogleFonts.poppins(
              color: isCompleted ? Colors.black : (isDark ? Colors.grey[400] : Colors.grey[600]),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String letter, String text, int index, Color normalColor, Color selectedColor, bool isDark) {
    bool isSelected = _selectedOptionIndex == index;
    
    return GestureDetector(
      onTap: () => setState(() => _selectedOptionIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : normalColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected ? [
            BoxShadow(
              color: const Color(0xFFB94A48).withOpacity(0.25),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ] : null,
        ),
        transform: isSelected ? (Matrix4.identity()..scale(1.01)) : Matrix4.identity(),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: Text(
                letter,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.black87 : (isDark ? Colors.grey[300] : Colors.grey[700]),
                ),
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? Colors.black87 : (isDark ? Colors.grey[300] : Colors.grey[700]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(bool isDark, Color successColor, Color surfaceColor) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            color: (isDark ? const Color(0xFF18181B) : Colors.white).withOpacity(0.95),
            border: Border(top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavButton(
                label: 'Soal Sebelum nya.',
                onPressed: () {},
                bgColor: surfaceColor,
                textColor: isDark ? Colors.grey[300]! : Colors.grey[600]!,
              ),
              _buildFinishButton(successColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({required String label, required VoidCallback onPressed, required Color bgColor, required Color textColor}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.05),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildFinishButton(Color successColor) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const QuizAnswerReviewScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: successColor,
        foregroundColor: Colors.black,
        elevation: 4,
        shadowColor: successColor.withOpacity(0.3),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        'Selesai.',
        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
