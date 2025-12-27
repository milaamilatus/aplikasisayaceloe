import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizAnswerReviewScreen extends StatelessWidget {
  const QuizAnswerReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryRed = const Color(0xFFC04D4B);
    final accentGreen = const Color(0xFF3BE62B);
    final backgroundColor = isDark ? const Color(0xFF111827) : Colors.white;
    final cardColor = isDark ? const Color(0xFF1F2937) : const Color(0xFFF8F9FA);
    final boxColor = isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB);
    final textMainColor = isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937);
    final textSubColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryRed,
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false, // As per HTML no back button in header
        title: Text(
          'Review Jawaban',
          style: GoogleFonts.poppins(
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Card
                _buildSummaryCard(cardColor, textMainColor, textSubColor),
                const SizedBox(height: 32),

                // Review List
                _buildReviewItem(
                  number: 1,
                  question: 'Radio button dapat digunakan untuk menentukan ?',
                  answer: 'A. Jenis Kelamin',
                  boxColor: boxColor,
                  textMainColor: textMainColor,
                  textSubColor: textSubColor,
                ),
                const SizedBox(height: 32),
                _buildReviewItem(
                  number: 2,
                  question: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
                  answer: 'B. Konsistensi',
                  boxColor: boxColor,
                  textMainColor: textMainColor,
                  textSubColor: textSubColor,
                ),
                const SizedBox(height: 32),
                _buildReviewItem(
                  number: 3,
                  question: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
                  answer: 'C. Konsistensi',
                  boxColor: boxColor,
                  textMainColor: textMainColor,
                  textSubColor: textSubColor,
                ),
                const SizedBox(height: 32),
                _buildReviewItem(
                  number: 4,
                  question: 'Radio button dapat digunakan untuk menentukan ?',
                  answer: 'A. Jenis Kelamin',
                  boxColor: boxColor,
                  textMainColor: textMainColor,
                  textSubColor: textSubColor,
                ),
                const SizedBox(height: 32),
                _buildReviewItem(
                  number: 5,
                  question: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
                  answer: 'C. Konsistensi',
                  boxColor: boxColor,
                  textMainColor: textMainColor,
                  textSubColor: textSubColor,
                ),
                const SizedBox(height: 32),
                _buildReviewItem(
                  number: 6,
                  question: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
                  answer: 'C. Konsistensi',
                  boxColor: boxColor,
                  textMainColor: textMainColor,
                  textSubColor: textSubColor,
                ),
                const SizedBox(height: 32),
                _buildReviewItem(
                  number: 7,
                  question: 'Radio button dapat digunakan untuk menentukan ?',
                  answer: 'A. Jenis Kelamin',
                  boxColor: boxColor,
                  textMainColor: textMainColor,
                  textSubColor: textSubColor,
                ),
                
                const SizedBox(height: 64),

                // Action Button
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        shadowColor: accentGreen.withOpacity(0.4),
                      ),
                      child: Text(
                        'Kirim Jawaban',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(Color cardColor, Color textMainColor, Color textSubColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow('Di Mulai Pada', 'Komis 25 Februari 2021 10:25', textMainColor, textSubColor),
          const SizedBox(height: 8),
          _buildSummaryRow('Status', 'Selesai', textMainColor, textSubColor),
          const SizedBox(height: 8),
          _buildSummaryRow('Selesai Pada', 'Komis 25 Februari 2021 10:40', textMainColor, textSubColor),
          const SizedBox(height: 8),
          _buildSummaryRow('Waktu Penyelesaian', '15 Menit 22 Detik', textMainColor, textSubColor),
          const SizedBox(height: 8),
          _buildSummaryRow('Nilai', '0 / 100', textMainColor, textSubColor),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, Color textMainColor, Color textSubColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textSubColor,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textMainColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewItem({
    required int number,
    required String question,
    required String answer,
    required Color boxColor,
    required Color textMainColor,
    required Color textSubColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            'Pertanyaan $number',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textMainColor,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  question,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: textMainColor,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jawaban Tersimpan',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: textSubColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        answer,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: textMainColor,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Lihat Soal',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[600],
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
