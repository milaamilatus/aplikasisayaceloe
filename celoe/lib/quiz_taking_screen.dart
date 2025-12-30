import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_answer_review_screen.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizTakingScreen extends StatefulWidget {
  const QuizTakingScreen({super.key});

  @override
  State<QuizTakingScreen> createState() => _QuizTakingScreenState();
}

class _QuizTakingScreenState extends State<QuizTakingScreen> {
  int _currentIndex = 0;
  final Map<int, int?> _answers = {};
  
  // Timer related
  Timer? _timer;
  int _remainingSeconds = 900; // 15 minutes
  int _elapsedSeconds = 0;
  DateTime? _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
          _elapsedSeconds++;
        });
      } else {
        _timer?.cancel();
        _showTimeOutDialog();
      }
    });
  }

  void _showTimeOutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Waktu Habis', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Text('Waktu pengerjaan kuis telah habis. Jawaban Anda akan otomatis dikirim.', style: GoogleFonts.poppins()),
        actions: [
          ElevatedButton(
            onPressed: () => _submitQuiz(),
            child: Text('OK', style: GoogleFonts.poppins(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
  
  final List<QuizQuestion> _questions = [
    QuizQuestion(
      question: 'Radio button dapat digunakan untuk menentukan ?',
      options: ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
      options: ['Keindahan', 'Konsistensi', 'Keseragaman', 'Kerapian', 'Keseimbangan'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Apa kepanjangan dari UID ?',
      options: ['User Interface Design', 'User Identification', 'User Interface Device', 'Unique ID', 'User Information Data'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Mana yang merupakan elemen dari prinsip Gestalt ?',
      options: ['Contrast', 'Proximity', 'Alignment', 'Repetition', 'Color'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Warna panas biasanya merepresentasikan ?',
      options: ['Semangat / Energi', 'Ketenangan', 'Kesedihan', 'Kelembutan', 'Keamanan'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Hierarki visual membantu pengguna untuk ?',
      options: ['Memahami urutan informasi', 'Melihat semua konten sekaligus', 'Mengabaikan detail', 'Mempercepat load page', 'Mengurangi warna'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Tipografi adalah seni dalam ?',
      options: ['Menggambar', 'Mewarnai', 'Menyusun huruf', 'Membuat layout', 'Fotografi'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'Salah satu tujuan UX adalah ?',
      options: ['Membuat UI mahal', 'Kepuasan Pengguna', 'Menambah fitur sebanyak mungkin', 'Memperumit navigasi', 'Menghapus teks'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Affordance dalam desain berarti ?',
      options: ['Biaya desain', 'Clue cara menggunakan elemen', 'Kecepatan akses', 'Kualitas gambar', 'Harga sebuah produk'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Figma merupakan tool untuk ?',
      options: ['Prototyping', 'Coding Backend', 'Editing Video', 'Spreadsheet', 'Presentasi Powerpoint'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Apa tujuan dari moodboard ?',
      options: ['Menulis kode', 'Rapat harian', 'Eksplorasi gaya visual', 'Membayar vendor', 'Testing aplikasi'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'Iconostasis adalah ?',
      options: ['Penyakit mata', 'Kumpulan icon standar', 'Sejenis font', 'Template desain', 'Warna latar'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Micro-interactions penting untuk ?',
      options: ['Memberi Feedback', 'Memperbesar file', 'Memperlambat animasi', 'Mengurangi kontras', 'Menghilangkan tombol'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Mobile-first design memprioritaskan ?',
      options: ['Layar monitor besar', 'Layar kecil', 'Televisi', 'Jam tangan', 'Kertas print'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Usability testing dilakukan pada ?',
      options: ['Akhir siklus saja', 'Awal siklus saja', 'Sepanjang proses desain', 'Hanya saat error', 'Setelah rilis ke pasar'],
      correctAnswerIndex: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentQuestion = _questions[_currentIndex];
    
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
                      children: List.generate(_questions.length, (index) {
                        int number = index + 1;
                        bool isAnswered = _answers.containsKey(index);
                        bool isCurrent = _currentIndex == index;
                        return GestureDetector(
                          onTap: () => setState(() => _currentIndex = index),
                          child: _buildQuestionIndicator(number, isAnswered, isCurrent, accentGreen, isDark),
                        );
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
                          'Soal Nomor ${_currentIndex + 1} ',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF111827),
                          ),
                        ),
                        Text(
                          '/ ${_questions.length}',
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
                      currentQuestion.question,
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
                  ...List.generate(currentQuestion.options.length, (index) {
                    final letter = String.fromCharCode(65 + index); // A, B, C...
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildOption(
                        '$letter.', 
                        currentQuestion.options[index], 
                        index, 
                        optionColor, 
                        selectedRed, 
                        isDark
                      ),
                    );
                  }),
                  
                  const SizedBox(height: 32),

                  // Navigation Buttons
                  Row(
                    children: [
                      if (_currentIndex > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => setState(() => _currentIndex--),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(color: primaryRed),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Text('SEBELUMNYA', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: primaryRed)),
                          ),
                        ),
                      if (_currentIndex > 0 && _currentIndex < _questions.length - 1)
                        const SizedBox(width: 16),
                      if (_currentIndex < _questions.length - 1)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => setState(() => _currentIndex++),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryRed,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Text('SELANJUTNYA', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                          ),
                        ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),

                  // Bottom Action Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _showSubmitConfirmation(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentGreen,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        'SUBMIT KUIS',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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


  void _showSubmitConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Submit Kuis?', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Text('Apakah Anda yakin ingin mengirimkan jawaban sekarang?', style: GoogleFonts.poppins()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal', style: GoogleFonts.poppins(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              _submitQuiz();
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3BE62B)),
            child: Text('Ya, Submit', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _submitQuiz() {
    _timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizAnswerReviewScreen(
          questions: _questions,
          answers: _answers,
          timeTakenSeconds: _elapsedSeconds,
        ),
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
                _formatTime(_remainingSeconds),
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

  Widget _buildQuestionIndicator(int number, bool isAnswered, bool isCurrent, Color accentGreen, bool isDark) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrent ? Colors.white : (isAnswered ? accentGreen : (isDark ? const Color(0xFF3F3F46) : const Color(0xFFF3F4F6))),
        border: Border.all(
          color: isCurrent ? const Color(0xFFB94B4B) : (isAnswered ? const Color(0xFF166534) : (isDark ? const Color(0xFF52525B) : const Color(0xFFE5E7EB))), 
          width: isCurrent ? 2 : 1
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 1))
        ],
      ),
      child: Center(
        child: Text(
          '$number',
          style: GoogleFonts.poppins(
            color: isCurrent ? const Color(0xFFB94B4B) : (isAnswered ? Colors.black : (isDark ? Colors.grey[400] : Colors.grey[600])),
            fontWeight: isCurrent || isAnswered ? FontWeight.bold : FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String letter, String text, int index, Color normalColor, Color selectedColor, bool isDark) {
    bool isSelected = _answers[_currentIndex] == index;
    
    return GestureDetector(
      onTap: () => setState(() => _answers[_currentIndex] = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : normalColor,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? Border.all(color: Colors.white.withOpacity(0.2), width: 1) : null,
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
                  color: isSelected ? Colors.white : (isDark ? Colors.grey[400] : Colors.grey[600]),
                ),
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : (isDark ? Colors.grey[300] : Colors.grey[700]),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
