import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizTakingScreen extends StatefulWidget {
  const QuizTakingScreen({super.key});

  @override
  State<QuizTakingScreen> createState() => _QuizTakingScreenState();
}

class _QuizTakingScreenState extends State<QuizTakingScreen> {
  int _selectedOptionIndex = 0; // Index 0 for Option A (based on HTML)

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryRed = const Color(0xFFB84B4B);
    final primaryLightRed = const Color(0xFFE86E6E);
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final surfaceColor = isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF5F5F5);
    final textMainColor = isDark ? const Color(0xFFE0E0E0) : const Color(0xFF333333);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Custom Header
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
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: List.generate(15, (index) {
                        return _buildQuestionNumber(index + 1, index == 0, isDark);
                      }),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Question Number
                  Row(
                    children: [
                      Text(
                        'Soal Nomor 1',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        ' / ',
                        style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '15',
                        style: GoogleFonts.inter(fontSize: 16, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Question Text
                  Text(
                    'Radio button dapat digunakan untuk menentukan ?',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textMainColor,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Options
                  _buildOption('A.', 'Jenis Kelamin', 0, primaryRed, primaryLightRed, true),
                  const SizedBox(height: 16),
                  _buildOption('B.', 'Alamat', 1, primaryRed, surfaceColor, false),
                  const SizedBox(height: 16),
                  _buildOption('C.', 'Hobby', 2, primaryRed, surfaceColor, false),
                  const SizedBox(height: 16),
                  _buildOption('D.', 'Riwayat Pendidikan', 3, primaryRed, surfaceColor, false),
                  const SizedBox(height: 16),
                  _buildOption('E.', 'Umur', 4, primaryRed, surfaceColor, false),
                  
                  const SizedBox(height: 48),

                  // Next Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: surfaceColor,
                        foregroundColor: isDark ? Colors.white : Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Soal Selanjut nya.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
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
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 48), // Spacer to balance timer
          Text(
            'Quiz Review 1',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.alarm, color: Colors.white, size: 24),
              const SizedBox(width: 8),
              Text(
                '15 : 00',
                style: GoogleFonts.inter(
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

  Widget _buildQuestionNumber(int number, bool isActive, bool isDark) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        border: Border.all(
          color: isActive ? const Color(0xFFB84B4B) : (isDark ? Colors.grey[700]! : Colors.grey[400]!),
          width: isActive ? 2 : 1,
        ),
      ),
      child: Center(
        child: Text(
          '$number',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String letter, String text, int index, Color primaryRed, Color bgColor, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedOptionIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? bgColor : bgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            )
          ] : null,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              child: Text(
                letter,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
