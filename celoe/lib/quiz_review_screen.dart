import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_taking_screen.dart';
import 'quiz_answer_review_screen.dart';

class QuizReviewScreen extends StatelessWidget {
  const QuizReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryRed = const Color(0xFFB94040);
    final primaryLightRed = const Color(0xFFE57373);
    final backgroundColor = isDark ? const Color(0xFF18181B) : Colors.white;
    final surfaceColor = isDark ? const Color(0xFF27272A) : const Color(0xFFF3F4F6);
    final textMainColor = isDark ? const Color(0xFFE5E7EB) : const Color(0xFF1F2937);
    final textSubColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryRed,
        elevation: 4,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Quiz Review 1',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 448), // max-w-md
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Instructions
                Text(
                  'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    height: 1.6,
                    color: textSubColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textSubColor,
                  ),
                ),
                const SizedBox(height: 24),

                // Info Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Kuis Akan di tutup pada Jumat, 26 February 2021, 11:59 PM',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontSize: 13, color: textSubColor),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Batas Waktu: 15 menit',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontSize: 13, color: textSubColor),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Metode Penilaian: Nilai Tertinggi',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontSize: 13, color: textSubColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Attempts Table
                Text(
                  'Percobaan Yang Sudah Di Lakukan',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      // Table Header
                      Container(
                        color: primaryLightRed,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            Expanded(child: _buildTableHeaderText('Status')),
                            Expanded(child: _buildTableHeaderText('Nilai / 100.00', align: TextAlign.center)),
                            Expanded(child: _buildTableHeaderText('Tinjau Kembali', align: TextAlign.right)),
                          ],
                        ),
                      ),
                      // Table Row
                      Container(
                        color: surfaceColor,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Selesai',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: isDark ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Dikirim Pada Kamis, 25 Februari 2021, 10:40',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '85,0',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: textMainColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const QuizAnswerReviewScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Lihat',
                                    style: GoogleFonts.inter(
                                      color: Colors.blue[600],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Final Score
                Center(
                  child: Text(
                    'Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Actions
                _buildActionButton(context, 'Ambil Kuis', surfaceColor, textMainColor, isDark),
                const SizedBox(height: 12),
                _buildActionButton(context, 'Kembali Ke Kelas', surfaceColor, textMainColor, isDark),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTableHeaderText(String text, {TextAlign align = TextAlign.left}) {
    return Text(
      text.toUpperCase(),
      textAlign: align,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String text, Color bgColor, Color textColor, bool isDark) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.66,
        child: ElevatedButton(
          onPressed: () {
            if (text == 'Ambil Kuis') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuizTakingScreen()),
              );
            } else {
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: textColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            shadowColor: Colors.black12,
          ),
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
