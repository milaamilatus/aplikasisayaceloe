import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPlaybackScreen extends StatelessWidget {
  const VideoPlaybackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryRed = const Color(0xFFBD4A4A);
    final backgroundColor = isDark ? const Color(0xFF111827) : Colors.white;
    final surfaceLight = const Color(0xFFF3F4F6);
    final surfaceDark = const Color(0xFF1F2937);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader(context, primaryRed)),
          SliverToBoxAdapter(child: _buildVideoPlayer(context, isDark)),
          _buildVideoList(isDark, surfaceLight, surfaceDark),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Color primaryRed) {
    return Container(
      height: 64 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: primaryRed,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 24),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Video - Belajar UI/UX Design',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer(BuildContext context, bool isDark) {
    return InkWell(
      onTap: () => _launchURL('https://www.youtube.com/watch?v=c9Wg6Cb_YlU'),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            image: const DecorationImage(
              image: NetworkImage(
                'https://img.youtube.com/vi/c9Wg6Cb_YlU/maxresdefault.jpg',
              ),
              fit: BoxFit.cover,
              opacity: 0.7,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '2024 UI/UX Design Crash Course in Figma',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: 0.45,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFBD4A4A)),
                        minHeight: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoList(bool isDark, Color surfaceLight, Color surfaceDark) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Video Lain Nya',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _buildVideoItem(
              title: 'Cara Mulai Belajar UI/UX Dari Nol Secara Otodidak',
              duration: '12:45',
              imageUrl: 'https://img.youtube.com/vi/7uK3E_2pG-c/0.jpg',
              videoUrl: 'https://www.youtube.com/watch?v=7uK3E_2pG-c',
              isDark: isDark,
              bgColor: isDark ? surfaceDark : surfaceLight,
            ),
            _buildVideoItem(
              title: 'Belajar Desain UI/UX Design Gratis - Bahasa Indonesia (Intro)',
              duration: '05:30',
              imageUrl: 'https://img.youtube.com/vi/2eY6iC8R_b0/0.jpg',
              videoUrl: 'https://www.youtube.com/watch?v=2eY6iC8R_b0',
              isDark: isDark,
              bgColor: isDark ? const Color(0xFF111827) : Colors.white,
              badge: 'U - Telkom',
            ),
            _buildVideoItem(
              title: '2024 UI/UX Design Crash Course in Figma',
              duration: '45:12',
              imageUrl: 'https://img.youtube.com/vi/b0wF1k1oWfY/0.jpg',
              videoUrl: 'https://www.youtube.com/watch?v=b0wF1k1oWfY',
              isDark: isDark,
              bgColor: isDark ? surfaceDark : surfaceLight,
              badge: 'U - Telkom',
            ),
            _buildVideoItem(
              title: 'Tutorial Dasar Figma Untuk Pemula - UI/UX Design',
              duration: '22:15',
              imageUrl: 'https://img.youtube.com/vi/jk1T6baWnIs/0.jpg',
              videoUrl: 'https://www.youtube.com/watch?v=jk1T6baWnIs',
              isDark: isDark,
              bgColor: isDark ? const Color(0xFF111827) : Colors.white,
              hasFigmaIcon: true,
            ),

          ]),
        ),
      ],
    );
  }

  Widget _buildVideoItem({
    required String title,
    required String duration,
    required String imageUrl,
    required String videoUrl,
    required bool isDark,
    required Color bgColor,
    String? badge,
    bool hasFigmaIcon = false,
  }) {
    return InkWell(
      onTap: () => _launchURL(videoUrl),
      child: Container(
        color: bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 140,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (badge != null)
                  Positioned.fill(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          badge,
                          style: GoogleFonts.inter(
                            color: const Color(0xFFBD4A4A),
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (hasFigmaIcon)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.asset(
                        'assets/images/ui_ux_icon.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      duration,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF1F2937),
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }
}
