import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_classes_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';

class AnnouncementDetailScreen extends StatelessWidget {
  const AnnouncementDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final textMainColor = isDark ? Colors.white : const Color(0xFF1F2937);
    final textSubColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
    const primaryColor = Color(0xFFB94E48);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: textMainColor,
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Pengumuman',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textMainColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 28), // Spacer for balance
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maintenance Pra UAS Semester Genap 2020/2021',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textMainColor,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDark ? Colors.grey[800] : Colors.grey[200],
                              ),
                              child: Icon(
                                Icons.person_rounded,
                                color: isDark ? Colors.grey[500] : Colors.grey[400],
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 12),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: textSubColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'By Admin CeLOE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: isDark ? Colors.grey[300] : Colors.grey[700],
                                    ),
                                  ),
                                  const TextSpan(text: ' - Rabu, 2 Juni 2021, 10:45'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: 4 / 3,
                            child: Stack(
                              children: [
                                Image.network(
                                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDUD26nTAGvNix_ZmcWEle0_5hebZmfoBKjYdDJPa17W57aUlcRSQPIT6XXl1TcnO2yazc7NaXnabVZvBnnWDZgQT6XqIhnRgS8XSAWIEyJJu0h36S2tC0aByIiU-FDDl5Jv2vUpemqLM6p7KZ4eD9CWA1XcJCejQZWyNSyVTKHuW2t9UnxIBUlpI_JEkPJpxpkluI5CLrgI2Ko066fzQtuBoG-D6R2XrQ4nVqzpUWLRY9uMpbMdzGnqUw3q1QQiRbCZeqGI5IzA4I',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.1),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: Text(
                            'Maintenance LMS',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: textMainColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).\n\nDengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.\n\nDemikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: isDark ? const Color(0xFFD1D5DB) : const Color(0xFF374151),
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Hormat Kami,',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isDark ? const Color(0xFFE5E7EB) : const Color(0xFF1F2937),
                          ),
                        ),
                        Text(
                          'CeLOE Telkom University',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: textSubColor,
                          ),
                        ),
                        const SizedBox(height: 120), // Spacer for bottom nav
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
              child: Container(
                height: 95,
                padding: const EdgeInsets.only(bottom: 10, top: 10, left: 24, right: 24),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, -4)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(context, Icons.home_rounded, 'Home', true),
                    _buildNavItem(context, Icons.school_rounded, 'Kelas Saya', false),
                    _buildNavItem(context, Icons.notifications_rounded, 'Notifikasi', false, hasNotification: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, bool isActive, {bool hasNotification = false}) {
    return GestureDetector(
      onTap: () {
        if (label == 'Kelas Saya' && !isActive) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyClassesScreen()),
          );
        } else if (label == 'Notifikasi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotificationScreen()),
          );
        } else if (label == 'Home' && !isActive) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Icon(
                icon,
                color: isActive ? Colors.white : Colors.white.withOpacity(0.8),
                size: 34,
              ),
              if (hasNotification)
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.yellow[400],
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFB94E48), width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: isActive ? Colors.white : Colors.white.withOpacity(0.8),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
