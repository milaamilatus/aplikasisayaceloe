import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF121212) : const Color(0xFFF9FAFB);
    final surfaceColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1F2937);
    const primaryColor = Color(0xFFB93C3C);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Header section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 48, bottom: 80, left: 24, right: 24),
                  decoration: const BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 30),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white.withOpacity(0.2), width: 4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/aida-public/AB6AXuCTNz0IxUE8UyNb6KanSvuPQDLk_2Eg8phEp1_EBEuYsw1YyE32sXx3o0aNMPXiO2NVS8zxxWrmhsg0f_PCUgrQhsy5qTlEQ5Z1_aSm9Q-wnhEsbcpQESEpDzEBqxTwpv-YWasNyIz-4pkgemniFKrOCYf_wQhPnLAUPZRwuyn-TLeJfMXTF6Ne_HNjNxzPmRAhpw0a7_nlA_DP1ed9wIgTC74LF4_fFruKeADxau-GvLiakW9WqvVsHmhzu4Y50DO6rU-B2srAjkE',
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'DANDY CANDRA PRATAMA',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Content Tabs
                Container(
                  transform: Matrix4.translationValues(0, -40, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            _buildTabItem(0, 'About Me', surfaceColor, primaryColor, textColor),
                            _buildTabItem(1, 'Kelas', surfaceColor, primaryColor, textColor),
                            _buildTabItem(2, 'Edit Profile', surfaceColor, primaryColor, textColor),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Informations Section
                      _buildSectionTitle('Informasi User', textColor),
                      const SizedBox(height: 16),
                      _buildInfoItem('Email address', 'dandycandra@365.telkomuniversity.ac.id', textColor, isDark),
                      _buildInfoItem('Program Studi', 'D4 Teknologi Rekayasa Multimedia', textColor, isDark),
                      _buildInfoItem('Fakultas', 'FIT', textColor, isDark),
                      
                      const SizedBox(height: 32),
                      
                      // Activities Section
                      _buildSectionTitle('Aktivitas Login', textColor),
                      const SizedBox(height: 16),
                      _buildActivityItem(
                        'First access to site', 
                        'Monday, 7 September 2020, 9:27 AM', 
                        '(288 days 12 hours)',
                        textColor, 
                        isDark
                      ),
                      _buildActivityItem(
                        'Last access to site', 
                        'Tuesday, 22 June 2021, 9:44 PM', 
                        '(now)',
                        textColor, 
                        isDark
                      ),
                      
                      const SizedBox(height: 120), // Spacer for bottom items
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Floating logout button
          Positioned(
            bottom: 110,
            right: 24,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout_rounded, color: Colors.white, size: 24),
              label: Text(
                'Log Out',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 8,
              ),
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 95,
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, -4)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home_rounded, 'Home', true),
                  _buildNavItem(Icons.school_rounded, 'Kelas Saya', false),
                  _buildNavItem(Icons.notifications_rounded, 'Notifikasi', false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String title, Color surfaceColor, Color primary, Color textColor) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? (Theme.of(context).brightness == Brightness.dark ? Colors.white : const Color(0xFF1F2937)) : Colors.grey[500],
                ),
              ),
                if (isSelected)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 32,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[400] : Colors.grey[600],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white.withOpacity(isActive ? 1.0 : 0.7), size: 32),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(isActive ? 1.0 : 0.7),
            fontSize: 11,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, Color textColor) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, Color textColor, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : Colors.grey[500],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: textColor.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String label, String date, String relativeTime, Color textColor, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : Colors.grey[500],
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: textColor.withOpacity(0.9),
              ),
              children: [
                TextSpan(text: date),
                TextSpan(
                  text: ' $relativeTime',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    color: isDark ? Colors.grey[400] : Colors.grey[500],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
