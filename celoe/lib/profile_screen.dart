import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0; // 0: About Me, 1: Kelas, 2: Edit Profile
  int _selectedNavIndex = 1; // 1: Kelas Saya (as shown in design)

  final List<Map<String, String>> _courses = [
    {
      'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC D4SM-41-GAB1 [ARS]',
      'date': 'Monday, 8 February 2021',
    },
    {
      'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
      'date': 'Monday, 8 February 2021',
    },
    {
      'title': 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]. JUMAT 2',
      'date': 'Monday, 8 February 2021',
    },
    {
      'title': 'OLAH RAGA D3TT-44-02 [EYR]',
      'date': 'Monday, 8 February 2021',
    },
    {
      'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF D4SM-43-04 [TPR]',
      'date': 'Monday, 8 February 2021',
    },
    {
      'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA D4SM-41-GAB1 [APJ]',
      'date': 'Monday, 8 February 2021',
    },
    {
      'title': 'SISTEM OPERASI D4SM-44-02 [DDS]',
      'date': 'Monday, 8 February 2021',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF121212) : const Color(0xFFF9FAFB);
    final surfaceColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1F2937);
    const primaryColor = Color(0xFFBA4646);

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
                                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBmx346awVB0n0u248vSYz24fCVY3rd3yvGb92L80DEYjupAK1pLcDOm75xwzNUJhrxRHH1YkuBTM0ZfjG8PHQ8o1xVcPc0bWV0x_oBz8k1vo_l8wGnAMJ14T48EC33VX1H19AA_ro1eflbEM4WUyjwex3BgvzTSJ6Fu2HTBnSlObWERL5tUA1bBE4jrCgV0mQm4Z0hw9HQA-vhKve5kaBqHm7N7GGtMlGAgx0mFFyGf5Yl0PSIvgLXG9-OTx7R-13EFtm7YldzVhg',
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
                            _buildTabItem(0, 'About Me', textColor),
                            _buildTabItem(1, 'Kelas', textColor),
                            _buildTabItem(2, 'Edit Profile', textColor),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Conditional Content
                      if (_selectedTabIndex == 0) _buildAboutMeContent(textColor, isDark)
                      else if (_selectedTabIndex == 1) _buildKelasContent(textColor, isDark)
                      else _buildEditProfileContent(textColor, isDark, primaryColor),
                      
                      const SizedBox(height: 120), // Spacer for bottom navigation
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
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, -4)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home_rounded, 'Home', 0),
                  _buildNavItem(Icons.school_rounded, 'Kelas Saya', 1),
                  _buildNavItem(Icons.notifications_rounded, 'Notifikasi', 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutMeContent(Color textColor, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Informasi User', textColor),
        const SizedBox(height: 16),
        _buildInfoItem('Email address', 'dandycandra@365.telkomuniversity.ac.id', textColor, isDark),
        _buildInfoItem('Program Studi', 'D4 Teknologi Rekayasa Multimedia', textColor, isDark),
        _buildInfoItem('Fakultas', 'FIT', textColor, isDark),
        
        const SizedBox(height: 32),
        
        _buildSectionTitle('Aktivitas Login', textColor),
        const SizedBox(height: 16),
        _buildActivityItem('First access to site', 'Monday, 7 September 2020, 9:27 AM', '(288 days 12 hours)', textColor, isDark),
        _buildActivityItem('Last access to site', 'Tuesday, 22 June 2021, 9:44 PM', '(now)', textColor, isDark),
      ],
    );
  }

  Widget _buildKelasContent(Color textColor, bool isDark) {
    return Column(
      children: _courses.map((course) => _buildCourseItem(course['title']!, course['date']!, textColor, isDark)).toList(),
    );
  }

  Widget _buildCourseItem(String title, String date, Color textColor, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF8AB6D6),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tanggal Mulai $date',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: isDark ? Colors.grey[400] : Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditProfileContent(Color textColor, bool isDark, Color primaryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Edit Profile', textColor),
        const SizedBox(height: 24),
        _buildEditField('Full Name', 'Dandy Candra Pratama', textColor, isDark),
        _buildEditField('Email', 'dandycandra@365.telkomuniversity.ac.id', textColor, isDark),
        _buildEditField('Program Studi', 'D4 Teknologi Rekayasa Multimedia', textColor, isDark),
        _buildEditField('Fakultas', 'FIT', textColor, isDark),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(
              'Save Changes',
              style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditField(String label, String initialValue, Color textColor, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: initialValue,
            style: GoogleFonts.poppins(color: textColor, fontSize: 14),
            decoration: InputDecoration(
              filled: true,
              fillColor: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String title, Color textColor) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected 
                    ? (Theme.of(context).brightness == Brightness.dark ? Colors.white : const Color(0xFF1F2937)) 
                    : Colors.grey[500],
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

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isActive = _selectedNavIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedNavIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon, 
            color: Colors.white.withOpacity(isActive ? 1.0 : 0.8), 
            size: isActive ? 40 : 32,
            shadows: isActive ? [const Shadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 4)] : null,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: isActive ? 11 : 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
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
