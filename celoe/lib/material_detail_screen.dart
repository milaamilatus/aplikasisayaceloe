import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialDetailScreen extends StatelessWidget {
  const MaterialDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF111827) : const Color(0xFFFFFFFF);
    final surfaceColor = isDark ? const Color(0xFF1F2937) : const Color(0xFFF9FAFB);
    final cardColor = isDark ? const Color(0xFF1F2937) : Colors.white;
    final textMainColor = isDark ? Colors.white : const Color(0xFF111827);
    final textSubColor = isDark ? const Color(0xFFD1D5DB) : const Color(0xFF4B5563);
    final primaryGreen = const Color(0xFF22C55E);

    return Scaffold(
      backgroundColor: surfaceColor,
      body: SafeArea(
        child: Column(
          children: [
            // Handle & Title Section
            Container(
              color: backgroundColor,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Center(
                    child: Container(
                      width: 48,
                      height: 6,
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Pengantar User Interface Design',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: textMainColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // Description Section
            Container(
              color: backgroundColor,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: textMainColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: textSubColor,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Tab Switcher
            Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF111827) : const Color(0xFFF9FAFB),
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? const Color(0xFF1F2937) : const Color(0xFFF3F4F6),
                  ),
                ),
              ),
              child: Row(
                children: [
                  _buildTab('Lampiran Materi', true, textMainColor, isDark),
                  _buildTab('Tugas dan Kuis', false, textMainColor, isDark),
                ],
              ),
            ),

            // List of Materials
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildMaterialItem(
                    icon: Icons.link_rounded,
                    title: 'Zoom Meeting Syncronous',
                    isCompleted: true,
                    rotateIcon: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    primaryGreen: primaryGreen,
                    isDark: isDark,
                  ),
                  _buildMaterialItem(
                    icon: Icons.description_outlined,
                    title: 'Pengantar User Interface Design',
                    isCompleted: false,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    primaryGreen: primaryGreen,
                    isDark: isDark,
                  ),
                  _buildMaterialItem(
                    icon: Icons.description_outlined,
                    title: 'Empat Teori Dasar Antarmuka Pengguna',
                    isCompleted: false,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    primaryGreen: primaryGreen,
                    isDark: isDark,
                  ),
                  _buildMaterialItem(
                    icon: Icons.description_outlined,
                    title: 'Empat Teori Dasar Antarmuka Pengguna',
                    isCompleted: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    primaryGreen: primaryGreen,
                    isDark: isDark,
                  ),
                  _buildMaterialItem(
                    icon: Icons.smart_display_outlined,
                    title: 'User Interface Design for Beginner',
                    isCompleted: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    primaryGreen: primaryGreen,
                    isDark: isDark,
                  ),
                  _buildMaterialItem(
                    icon: Icons.link_rounded,
                    title: '20 Prinsip Desain',
                    isCompleted: true,
                    rotateIcon: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    primaryGreen: primaryGreen,
                    isDark: isDark,
                  ),
                  _buildMaterialItem(
                    icon: Icons.link_rounded,
                    title: 'Best Practice UI Design',
                    isCompleted: true,
                    rotateIcon: true,
                    cardColor: cardColor,
                    textMainColor: textMainColor,
                    primaryGreen: primaryGreen,
                    isDark: isDark,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isActive, Color textColor, bool isDark) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive 
                  ? (isDark ? Colors.white : Colors.black) 
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? textColor : Colors.grey[500],
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialItem({
    required IconData icon,
    required String title,
    required bool isCompleted,
    bool rotateIcon = false,
    required Color cardColor,
    required Color textMainColor,
    required Color primaryGreen,
    required bool isDark,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? const Color(0xFF374151) : Colors.transparent,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Transform.rotate(
            angle: rotateIcon ? 0.785398 : 0, // 45 degrees in radians
            child: Icon(
              icon,
              size: 20,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isDark ? const Color(0xFFE5E7EB) : const Color(0xFF1F2937),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.check_circle_rounded,
            color: isCompleted ? primaryGreen : (isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB)),
            size: 24,
          ),
        ],
      ),
    );
  }
}
