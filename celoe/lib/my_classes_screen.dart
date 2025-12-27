import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'material_detail_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';
import 'course_detail_screen.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF111827) : Colors.white;
    final textMainColor = isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937);
    final textSubColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
    final primaryRed = const Color(0xFFAA3A3A);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? const Color(0xFF1F2937) : const Color(0xFFF3F4F6),
                    width: 1,
                  ),
                ),
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
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: textMainColor,
                        size: 28,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Kelas Saya',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textMainColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 36), // To balance the back button
                ],
              ),
            ),

            // Course List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                   _buildCourseItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAWqtWHmxfD0OIQ3A6u2krDPvHgBvEmtZT6Xty0-hsGZP9gCYd1ugTTtUkqDpiPLrTKhWdSqWyVUX0C2AyEyUjAr0ALiEeQrQksk8W786ncJlqJSJl_42DnoErclURmdNGmw_wOaLJy1ssmp7t52A6gcDTCftC_-Zp8swMj8VOIbOOC7kOExXVJdnzOt1Z4bYKgjYRCquVHlOXG7yNDCohA3pQDAgS19kD54TdcfCZVJqCrglN5FzlCLwxDnSqqY7SxCZVFU4M7NBU',
                    semester: '2021/2',
                    title: 'Desain Antarmuka & Pengalaman Pengguna D4SM-42-03 [ADY]',
                    progress: 0.89,
                    placeholderColor: Colors.yellow[100]!,
                    textMainColor: textMainColor,
                    textSubColor: textSubColor,
                    primaryRed: primaryRed,
                    context: context,
                  ),
                  _buildCourseItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBmwlNpF8aTCPitutcm8CvxcoWQqShbqzIc4rJwvq3eWTFg_nxPPFUVsI3KMB_0v2S2dJ1XRLE9xsPj4vs8S0bG_nMc1O9E8taYHFZqvw-O4g5YTFn9Az9QwY9it5cCWJojnaMSrZ7ff_Xn_OtdDVbF4K7DjlnxmuR1IFjAhFuckaoZN4UvbzSukrOyTeSx-DVRzW0bIl7ignpmO8MD94fPIgnZy5YIjGT5XCCoItdxEzMT_s1ZYMKr4_rW-1NPzKLfiVgYW9gaXuU',
                    semester: '2021/2',
                    title: 'Kewarganegaraan D4SM-41-GAB1 [BBG], Jumat 2',
                    progress: 0.65,
                    placeholderColor: Colors.red[100]!,
                    textMainColor: textMainColor,
                    textSubColor: textSubColor,
                    primaryRed: primaryRed,
                    context: context,
                  ),
                  _buildCourseItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAmcFwsNXjCg96ti2CfKOZhvFOvAX7Hs4j9onQvmEpYxSdXzjlSAZhsXP1tOvLNXgI-sumTJzb84_24Qpc-IN7IM7ZeJ88BH_f0oH_9R6_-_culaZoVg1THgurPeDpx3AcbFA88zYyCWA7BTTez2l69W5kRLsmjmb4rwS3-ovfGzu4nUOrdj3OyrvCvhntRs6EzKja1owI27xmXVE6ulf_7829k6Meaze1L73HT3-JkMYt25IpG-fpegp-XfudRYQNtCCL2eRivSAs',
                    semester: '2021/2',
                    title: 'Sistem Operasi D4SM-44-02 [DOS]',
                    progress: 0.90,
                    placeholderColor: Colors.blueGrey[100]!,
                    textMainColor: textMainColor,
                    textSubColor: textSubColor,
                    primaryRed: primaryRed,
                    context: context,
                  ),
                  _buildCourseItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAfARaFWDsLKRJz_ru0g6ESRR-azs2F7MT8eKcUhX8zSOO6ZjdOmZ9FKZw0S3GVnlkc19iVDPCU7L68i0P6jTd0RNoyWXzi5U28rQNPzafK9GvnLigdvF7H5LQronzvnaNrz8G4KRitxRh66rZg1N0WQmU6ilSmZ3aC95rdlczE03tuoV-1HXy7YGv3xPhQXH5pvBHTfp2HQr8ZnrzPhh5a-XcE0oV-mQFmoRVTPcWTyVRPnL03rYNb7Xm39fFhngYqAxO0TrEOvqQ',
                    semester: '2021/2',
                    title: 'Pemrograman Perangkat Bergerak Multimedia D4SM-41-GAB1 [APJ]',
                    progress: 0.50,
                    placeholderColor: Colors.cyan[100]!,
                    textMainColor: textMainColor,
                    textSubColor: textSubColor,
                    primaryRed: primaryRed,
                    context: context,
                  ),
                  _buildCourseItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAEeCAzIsTwHWqZjL6fRmafR86h9YPd_cEXu-iYps8KnH5C2mM6a61N4jWJqAyiP8Rduyva7ybqub9y40Qf3AEdPQ4UX9HgppEso7NCVQ-uymam9-CzVBA4GOqN42v6Oe-4pcI5dL8BRTujn4LFw01OoDt4HzgJn6VvYS2-gE_HLtHYidUArBrLMraqs65-bzxV53ZGUJKnOEf9gVxD5YyS4wTc43HiRYHr13UXoZyHhn7fBS_yhN3M8ZoY1owVy6Vs1HUvw5nBrE8',
                    semester: '2021/2',
                    title: 'Bahasa Inggris: Business and Scientific D4SM-41-GAB1 [ARS]',
                    progress: 0.90,
                    placeholderColor: Colors.grey[300]!,
                    textMainColor: textMainColor,
                    textSubColor: textSubColor,
                    primaryRed: primaryRed,
                    context: context,
                  ),
                  _buildCourseItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB6t4nnTgeso07f2e59IKgpEqKY9PMyC8Z_5jAj-8ZMCZGGNBEw2awjq0IBijGoMKdtMk4F7BN2I34r2_JDIRf_JJDgpRMK83PeaRIEt5O2dLRYwkAzuUvNeDeOSdC5II1_cL_Bg7kY9GsEJwjhmmqarKxxa7g2og-z5vN1DoeNuIT8reugdZHh1ag-cEYFs2dc6cNCM232yPNN7lyXvTzJ2XSM8FtT8D7FvedbwZ_zw31leXmvFJJuB7c4omKlzttefHzNldvWljg',
                    semester: '2021/2',
                    title: 'Pemrograman Multimedia Interaktif D4SM-43-04 [TPR]',
                    progress: 0.50,
                    placeholderColor: Colors.blue[100]!,
                    textMainColor: textMainColor,
                    textSubColor: textSubColor,
                    primaryRed: primaryRed,
                    context: context,
                  ),
                  _buildCourseItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDt4YArIsmk1buNZ1MxsP_0BuVG3Sbqk_LNTIVUOEz7c6CcKsABJXymMa_4LMiTV7YzBAscBYxiPVmqsMHECMjDVJ3oUZUe0DXWEBzM3CHTyZmzJOtnb1aJnb_HJSYqZgc_NwUn4tUGJ8mJxEKf5ZyVxet16zBoUZd55QN7LeHsHEqf3TgsNStcscJ1ufnjhW5K5O3A9Ui5nfixI2lYaxUrYB5TSa72GDQr5w_HeemPOmOpiZh33eH4YuZEcmSlH-vWWjfolhaUBEw',
                    semester: '2021/2',
                    title: 'Olah Raga D3TT-44-02 [EYR]',
                    progress: 0.60,
                    placeholderColor: Colors.purple[100]!,
                    textMainColor: textMainColor,
                    textSubColor: textSubColor,
                    primaryRed: primaryRed,
                    context: context,
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 95,
        padding: const EdgeInsets.only(bottom: 12, left: 32, right: 32),
        decoration: BoxDecoration(
          color: primaryRed,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_rounded, 'Home', false, context),
            _buildNavItem(Icons.school_rounded, 'Kelas Saya', true, context),
            _buildNavItem(Icons.notifications_rounded, 'Notifikasi', false, context),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseItem({
    required String imageUrl,
    required String semester,
    required String title,
    required double progress,
    required Color placeholderColor,
    required Color textMainColor,
    required Color textSubColor,
    required Color primaryRed,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CourseDetailScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: placeholderColor,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    semester,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: textSubColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: textMainColor,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: progress,
                        child: Container(
                          height: 12,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [primaryRed, const Color(0xFFEF4444)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${(progress * 100).toInt()}% Selesai',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: textMainColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, BuildContext context) {
    return GestureDetector(
       onTap: () {
        if (!isActive) {
          if (label == 'Notifikasi') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          } else if (label == 'Home') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                icon,
                color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
                size: 32,
              ),
              if (isActive)
                Positioned(
                  bottom: -6,
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
