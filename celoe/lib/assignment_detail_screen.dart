import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'upload_file_screen.dart';

class AssignmentDetailScreen extends StatelessWidget {
  const AssignmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xffB94545);
    final secondaryColor = const Color(0xffEA6666);
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final surfaceColor = isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF5F5F5);
    final textColor = isDark ? const Color(0xFFE0E0E0) : const Color(0xFF333333);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Tugas 01 - UID Android Mobile Game',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        elevation: 4,
        shadowColor: Colors.black26,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 672),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInstructions(textColor, isDark),
                const SizedBox(height: 32),
                _buildStatusSection(textColor, secondaryColor, surfaceColor, isDark),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadFileScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isDark ? const Color(0xFF374151) : const Color(0xFFF3F4F6),
                      foregroundColor: textColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 2,
                    ),
                    child: Text(
                      'Tambahkan Tugas',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInstructions(Color textColor, bool isDark) {
    final instructions = [
      'Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.',
      'Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.',
      'Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.',
      'Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.',
      'File dikumpulkan dalam format .PDF dengan size maksimal 5MB.',
      'Tugas dikumpulkan paling lambat hari Jum\'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(instructions.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                child: Text(
                  '${index + 1}.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  instructions[index],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    height: 1.6,
                    color: isDark ? Colors.grey[300] : Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildStatusSection(Color textColor, Color secondaryColor, Color surfaceColor, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[200]!),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: secondaryColor,
            child: Text(
              'Status Tugas',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          _buildStatusRow('Status', 'Sudah Mengirim untuk di nilai', surfaceColor, true, isDark),
          _buildStatusRow('Status Nilai', 'Belum Di nilai', isDark ? const Color(0xFF1E1E1E) : Colors.white, false, isDark),
          _buildStatusRow('Batas tanggal', 'Jumat, 26 Februari 2021, 23:59 WIB', surfaceColor, true, isDark),
          _buildStatusRow('Sisa Waktu', 'Tugas sudah di kirim 4 Hari 5 Jam Sebelum nya', isDark ? const Color(0xFF1E1E1E) : Colors.white, false, isDark, textOverrideColor: Colors.green),
          _buildStatusRow('File Tugas', 'Dandy Candra Pratama_770887084.pdf', surfaceColor, true, isDark, isLink: true),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, Color bgColor, bool isShaded, bool isDark, {Color? textOverrideColor, bool isLink = false}) {
    final primaryRed = const Color(0xffB94545);
    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: isDark ? Colors.grey[300] : Colors.grey[800],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: isLink
                ? InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.description_rounded, size: 16, color: primaryRed),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            value,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: primaryRed,
                              decoration: TextDecoration.underline,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                : Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: textOverrideColor != null ? FontWeight.w500 : FontWeight.normal,
                      color: textOverrideColor ?? (isDark ? Colors.grey[400] : Colors.grey[700]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
