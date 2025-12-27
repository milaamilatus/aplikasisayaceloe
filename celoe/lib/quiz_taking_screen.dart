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
  int _currentQuestion = 1;
  int _selectedOptionIndex = 0; // Option A is selected in HTML
  final int _totalQuestions = 15;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Custom Colors from HTML
    const primaryRed = Color(0xFFB94B4B);
    const accentGreen = Color(0xFF39E639);
    const selectedRed = Color(0xFFEF6666);
    final backgroundColor = isDark ? const Color(0xFF18181B) : const Color(0xFFF8F9FA);
    final surfaceColor = isDark ? const Color(0xFF27272A) : Colors.white;
    final optionColor = isDark ? const Color(0xFF3F3F46) : const Color(0xFFF3F4F6);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          _buildHeader(primaryRed),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  // Question Grid
                  Center(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: List.generate(_totalQuestions, (index) {
                        int number = index + 1;
                        bool isCompleted = true; // In HTML all seem green/completed
                        return _buildQuestionIndicator(number, isCompleted, accentGreen, isDark);
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF111827),
                          ),
                        ),
                        Text(
                          '/ $_totalQuestions',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
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
                      'Radio button dapat digunakan untuk menentukan ?',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isDark ? const Color(0xFFE5E7EB) : const Color(0xFF1F2937),
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Options
                  _buildOption('A.', 'Jenis Kelamin', 0, optionColor, selectedRed, isDark),
                  const SizedBox(height: 16),
                  _buildOption('B.', 'Alamat', 1, optionColor, selectedRed, isDark),
                  const SizedBox(height: 16),
                  _buildOption('C.', 'Hobby', 2, optionColor, selectedRed, isDark),
                  const SizedBox(height: 16),
                  _buildOption('D.', 'Riwayat Pendidikan', 3, optionColor, selectedRed, isDark),
                  const SizedBox(height: 16),
                  _buildOption('E.', 'Umur', 4, optionColor, selectedRed, isDark),
                  
                  const SizedBox(height: 48),

                  // Bottom Action Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const QuizAnswerReviewScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? const Color(0xFF27272A) : const Color(0xFFF3F4F6),
                      foregroundColor: isDark ? const Color(0xFFD1D5DB) : const Color(0xFF374151),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: isDark ? const Color(0xFF3F3F46) : const Color(0xFFE5E7EB)),
                      ),
                    ),
                    child: Text(
                      'Kembali Ke Halaman Review',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
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
          const SizedBox(width: 64), // Spacer for balance
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
                '15:00',
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

  Widget _buildQuestionIndicator(int number, bool isCompleted, Color accentGreen, bool isDark) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: accentGreen,
        border: Border.all(color: const Color(0xFF166534), width: 1), // border-green-600
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 1))
        ],
      ),
      child: Center(
        child: Text(
          '$number',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 12,
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
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ] : [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 2,
              offset: const Offset(0, 1),
            )
          ],
        ),
        transform: isSelected ? (Matrix4.identity()..scale(0.99)) : Matrix4.identity(),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: Text(
                letter,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? const Color(0xFF111827) : (isDark ? Colors.grey[400] : Colors.grey[600]),
                ),
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? const Color(0xFF111827) : (isDark ? Colors.grey[300] : Colors.grey[700]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
