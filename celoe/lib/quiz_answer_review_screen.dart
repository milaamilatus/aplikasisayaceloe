import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_taking_screen.dart'; // To access QuizQuestion model

class QuizAnswerReviewScreen extends StatelessWidget {
  final List<QuizQuestion>? questions;
  final Map<int, int?>? answers;

  final int? timeTakenSeconds;

  const QuizAnswerReviewScreen({
    super.key,
    this.questions,
    this.answers,
    this.timeTakenSeconds,
  });

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

    // Calculate score if we have data
    double score = 0;
    if (questions != null && answers != null) {
      int correctCount = 0;
      for (int i = 0; i < questions!.length; i++) {
        if (answers![i] == questions![i].correctAnswerIndex) {
          correctCount++;
        }
      }
      score = (correctCount / questions!.length) * 100;
    } else {
      score = 66.67; // Default/Static score
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryRed,
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: true, // Allow going back
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
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
                _buildSummaryCard(cardColor, textMainColor, textSubColor, score),
                const SizedBox(height: 32),

                // Review List
                if (questions != null && answers != null)
                  ...List.generate(questions!.length, (index) {
                    final q = questions![index];
                    final userAnswerIndex = answers![index];
                    final isCorrect = userAnswerIndex == q.correctAnswerIndex;
                    final userAnswerText = userAnswerIndex != null 
                        ? '${String.fromCharCode(65 + userAnswerIndex)}. ${q.options[userAnswerIndex]}'
                        : 'Belum Dijawab';
                    final correctAnswerText = '${String.fromCharCode(65 + q.options.indexOf(q.options[q.correctAnswerIndex]))}. ${q.options[q.correctAnswerIndex]}';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: _buildReviewItem(
                        context: context,
                        index: index,
                        userAnswerIndex: userAnswerIndex,
                        isDark: isDark,
                        number: index + 1,
                        question: q.question,
                        answer: userAnswerText,
                        isCorrect: isCorrect,
                        correctAnswer: isCorrect ? null : correctAnswerText,
                        boxColor: boxColor,
                        textMainColor: textMainColor,
                        textSubColor: textSubColor,
                      ),
                    );
                  })
                else ...[
                  // Keep static fallback if no data provided
                  _buildReviewItem(
                    context: context,
                    index: 0,
                    userAnswerIndex: 0,
                    isDark: isDark,
                    number: 1,
                    question: 'Radio button dapat digunakan untuk menentukan ?',
                    answer: 'A. Jenis Kelamin',
                    isCorrect: true,
                    boxColor: boxColor,
                    textMainColor: textMainColor,
                    textSubColor: textSubColor,
                  ),
                  const SizedBox(height: 32),
                  _buildReviewItem(
                    context: context,
                    index: 1,
                    userAnswerIndex: 1,
                    isDark: isDark,
                    number: 2,
                    question: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
                    answer: 'B. Konsistensi',
                    isCorrect: true,
                    boxColor: boxColor,
                    textMainColor: textMainColor,
                    textSubColor: textSubColor,
                  ),
                ],
                
                const SizedBox(height: 32),

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
                        'Kembali Ke Review Kuis',
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

  Widget _buildSummaryCard(Color cardColor, Color textMainColor, Color textSubColor, double score) {
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
          _buildSummaryRow('Di Mulai Pada', 'Sabtu, 27 Desember 2025 10:25', textMainColor, textSubColor),
          const SizedBox(height: 8),
          _buildSummaryRow('Status', 'Selesai', textMainColor, textSubColor),
          const SizedBox(height: 8),
          _buildSummaryRow('Selesai Pada', '${DateTime.now().day} Desember 2025 ${DateTime.now().hour}:${DateTime.now().minute}', textMainColor, textSubColor),
          const SizedBox(height: 8),
          _buildSummaryRow('Waktu Penyelesaian', timeTakenSeconds != null ? _formatTime(timeTakenSeconds!) : '15 Menit 22 Detik', textMainColor, textSubColor),
          const SizedBox(height: 8),
          _buildSummaryRow('Nilai', '${score.toStringAsFixed(2)} / 100', textMainColor, textSubColor),
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
    required BuildContext context,
    required int index,
    required int? userAnswerIndex,
    required bool isDark,
    required int number,
    required String question,
    required String answer,
    required bool isCorrect,
    String? correctAnswer,
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Jawaban Tersimpan',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: textSubColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: isCorrect ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  isCorrect ? 'BENAR' : 'SALAH',
                                  style: GoogleFonts.poppins(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: isCorrect ? Colors.green : Colors.red,
                                  ),
                                ),
                              ),
                            ],
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
                          if (!isCorrect && correctAnswer != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              'Jawaban Benar: $correctAnswer',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        if (questions != null) {
                          _showSoalDialog(context, questions![index], userAnswerIndex, isDark);
                        }
                      },
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

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '${mins} Menit ${secs} Detik';
  }

  void _showSoalDialog(BuildContext context, QuizQuestion q, int? userAnswerIndex, bool isDark) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF1F2937) : Colors.white,
        title: Text('Detail Soal', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(q.question, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
              const SizedBox(height: 16),
              ...List.generate(q.options.length, (i) {
                bool isCorrect = i == q.correctAnswerIndex;
                bool isUserChoice = i == userAnswerIndex;
                Color textColor = isDark ? Colors.white70 : Colors.black87;
                if (isCorrect) textColor = Colors.green;
                if (isUserChoice && !isCorrect) textColor = Colors.red;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        isCorrect ? Icons.check_circle : (isUserChoice ? Icons.cancel : Icons.circle_outlined),
                        size: 16,
                        color: isCorrect ? Colors.green : (isUserChoice ? Colors.red : Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${String.fromCharCode(65 + i)}. ${q.options[i]}',
                          style: GoogleFonts.poppins(color: textColor, fontWeight: (isCorrect || isUserChoice) ? FontWeight.bold : FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Tutup', style: GoogleFonts.poppins(color: const Color(0xFFC04D4B))),
          ),
        ],
      ),
    );
  }
}
