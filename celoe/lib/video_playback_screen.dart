import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Column(
        children: [
          _buildHeader(context, primaryRed),
          _buildVideoPlayer(context, isDark),
          Expanded(
            child: _buildVideoList(isDark, surfaceLight, surfaceDark),
          ),
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
              'Video - User Interface Design For Beginner',
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
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            // Thumbnail
            Positioned.fill(
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDgY9MYPAIux_3QW__mCD8zcynAmDvQD8-LkU5hAGJ8z8JLEarG2aGeM6lbNYrxs5-1hZ_lnR2cF11Vo62f0EZDTRtOsB99AZ32x1uS7byysskAUFB7T5u7iQmINolqq79RJuLlQ58u-pmyT73SWiUUGtn3BOyJEvvqhTPeyTNYl4qWVNfDRcjMHU9hP4MGT0jdzXgzNu3FiWkcgYKhVgM6Cp_b-4UCYJekxtaPb0HnvaUOLHgn3QOYfcvyIJM4zqCEA0AnsqTOvUY',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.9),
              ),
            ),
            
            // Central UI Text Overlay
            Center(
              child: Text(
                'UI\nDESIGN',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 8,
                  height: 1.1,
                  shadows: [
                    const Shadow(
                      color: Colors.black45,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),

            // Play Button
            Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red[600],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),

            // Controls Overlay
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.33,
                            child: Container(
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.red[600],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          Positioned(
                            left: (MediaQuery.of(context).size.width - 24) * 0.33,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '04:20 / 12:45',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.volume_up_rounded, color: Colors.white, size: 20),
                    const SizedBox(width: 12),
                    const Icon(Icons.fullscreen_rounded, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoList(bool isDark, Color surfaceLight, Color surfaceDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildVideoItem(
                title: 'Interaction Design',
                duration: '08:12',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBHsg9vEFyawELL5F4CLABLGNslIVK92S2W1d62XA5TjeXN-FOUJScXfJVQWLI4blf4qI87MmsulsSQgOrVKTeyTI5-l87-GrkkKxW3lmgWBwPVmVVEpif3PsP5g8GwLXeFw9E_eks6-2DPduJ-ZkXuvxx5NEEK0GxuT2wP3ZaV5m2Dm98q7lxewTmogLAhDV1n_brvppo4RxX8rRTK5KIatJcF5lrs46L_5a8Sm5MhCWULvx8z9tKidbILGo7ratzxmpYj0jUXg6A',
                isDark: isDark,
                bgColor: isDark ? surfaceDark : surfaceLight,
              ),
              _buildVideoItem(
                title: 'Pengantar Desain Antarmuka Pengguna',
                duration: '10:45',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAgfQoEeEP_Xihjwwm4B_fKv6J09WANYB0kRNPzlTwbHMiVZpAZvd6qLhq4bFEsXaGGckuPGfcLT9cyhiUu0sxA_SCcQhnRJpxPmZc1rUeh5Ghyl6jbnCOeSbNAo3u7dZm7SgGJVkgid2D5PBfgCiwxxwAlzqs1RsNYjvdl82WLjO8_wiGVBeurif2R6Q9_-qs4U332hhcLBai-mLTn-kVaR4gOLWKXBvmi-iM01P1ffh5_1G9VKtXucErJGyLgM-X6GE5RDsAND-c',
                isDark: isDark,
                bgColor: isDark ? const Color(0xFF111827) : Colors.white,
                badge: 'U - Telkom',
              ),
              _buildVideoItem(
                title: '4 Teori Dasar Desain Antarmuka Pengguna',
                duration: '15:20',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAx4BzxVc7Ooa4_AwT4pOhAQLRFUtDBUGIFe87RGCe8AhB8Vv-WCUehIMpNJh41bdTkqWnZrg8j9g8Du1lQyK3IeWn9zmHQBrXPNKh-X_EtlFgFC2LXrLFVjCFEsYjq_ZI-QGMcVQm-jZWUu04W2fePHJbvt4t15GbSDHcgURSTa64uRIFbkdy86TmsVSgPK5n3m59viiMsUv8AegJpzYMIelm0TVD-nX62JJT0si8zlaTX6al1dSxTlYm-xIaZmBVya4RqbZComLg',
                isDark: isDark,
                bgColor: isDark ? surfaceDark : surfaceLight,
                badge: 'U - Telkom',
              ),
              _buildVideoItem(
                title: 'Tutorial Dasar Figma - UI/UX Design Software',
                duration: '22:15',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDvia7f44B0K6mv4Hp3rGk0cBCh6kwr9shFW_PEknMP0krlbGXFqdJNLe8s2P7B5gcnNUyIMMeDtsu6CUdN5FVloGKAcqmZI9F-qW0yn7VcGSMrbWt4vlaKLWR6UF8zV64NOUeOiw2ScOL5yYFQyUQDpQc-vEN2mqYdLNx640fCm9f6fc3V6PGDPAF0u3WKycIyYJRiB9KjOQ1QN340JRy4BOldzJWFMn1BjEbxK8O-cKhOg31TGKpbY4EMd8TqZrwffIT6FS2BlEc',
                isDark: isDark,
                bgColor: isDark ? const Color(0xFF111827) : Colors.white,
                hasFigmaIcon: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVideoItem({
    required String title,
    required String duration,
    required String imageUrl,
    required bool isDark,
    required Color bgColor,
    String? badge,
    bool hasFigmaIcon = false,
  }) {
    return InkWell(
      onTap: () {},
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
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuBL6YZyyLxfJLjox3Q-yvZrz-TRhG6MTP5tKIEBD1dbHirvfdw-Pt6WWpzludgjeqVrql9k6WiRuMIDxjvBHtMKC-jxWMNDVnpwwOPhRLerMVjVBKoEPMMfARPzXo6zW3GekYb4DYlRaupqBE58TBnDR9N0Hc-7X2V_SibhMl0PIJ4boaSxYDYSxOUZ3OlQ_8-8PZmAA1Iyn2pNHEl1hwhiWjEpA4z1FWfi393jqLB6V4NMX-V1D7q3k9IKcPtOHsGKXK_kx2lScvE',
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
}
