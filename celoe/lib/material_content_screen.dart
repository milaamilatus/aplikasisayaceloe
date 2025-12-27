import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialContentScreen extends StatelessWidget {
  const MaterialContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF121212) : const Color(0xFFFAFAFA);
    final primaryRed = const Color(0xFFC13D45);
    final contentGray = const Color(0xFF333333);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context, primaryRed),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF121212) : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Pattern Overlay
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.05,
                        child: Image.network(
                          'https://www.transparenttextures.com/patterns/cubes.png',
                          repeat: ImageRepeat.repeat,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeroSection(isDark),
                        _buildCourseTitleBar(contentGray),
                        _buildIntroductionSection(isDark),
                        _buildDivider(),
                        _buildUISection(isDark),
                        _buildDivider(),
                        _buildImportanceSection(isDark),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, Color primaryRed) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: primaryRed,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Pengantar User Interface Design',
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF999999),
                border: Border.all(color: Colors.black.withOpacity(0.8), width: 1.5),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Halaman',
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    '1/26',
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroSection(bool isDark) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCYZ_QEPeBHjdAm13qiYsxobhhuuxy1nEOBDc76mYWWkLc9gG22R41BmNNslpTsNIC_uTvhmnTeLTaI0x8PbN0cy6UcqQnvx0SPrls5oex3k1SW4YqSTaYk6pSTQBu3gPJieIqYB98foe7YiqKUnMTne5tZle_tslQaB6NpARV0cji5sgi0IzdjFm94vCWposcIBJl84ajJf22en3cG8Zk_Lx4pskaQ1-KuTDwwr1z_wEQRd6n_MMIMyuLt1aq0SGmx5OB4ZhnLKMU',
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFC13D45).withOpacity(0.1),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            color: isDark ? const Color(0xFFE5E7EB) : Colors.white,
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Color(0x22FFFFFF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBXEaBQmgibo32-n4pfjMBeup_oQN6pPgwyYQluHmwY4YOIUXg73cIkYJPiqjHkI4x_8ovDN9B7ZnKLjk2PXxFKSToh-iTY7TZr_Xe-lwXiVrSAx2YwXD9-iXhZ6UeMr4vEKNlFupYGVpUhlGNGWa7WJYBEaAO_NFwJzjh8F4fdB1vKjYzns-JUcivW63riRHtQJFNcfZrmPN4bYvAC2HS1A7sks9hUlI-giIQeL0wfmddlMr7qeD_KEFA3Bqr7P0zx5Oen_kfRDpU',
                    width: 64,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseTitleBar(Color contentGray) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF333333),
        border: Border(top: BorderSide(color: Color(0xFF991B1B), width: 4)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey.shade500, width: 0.5)),
              ),
              child: Text(
                'Pengantar Desain Antarmuka Pengguna',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'VE124',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF4D4D),
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  'UI / UX DESIGN',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFFF4D4D),
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroductionSection(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          Text(
            'Perkenalan',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBd8D1KCC-uaTNvSXsDnynZFYVIafyRYyhUH9pq_hP6O5qlatnHHzS-t6hbZlEJgd0Mu7x6BrrZU-xhHTrdxIl2Idyby0TqD79C8m910fftfrgQie5RnrPPmV7KhI43XfthKluPohLrhVloPSJ9vCpB1GZoVQZaxSqEPPFG6uPB_4Akctli3ifMNF47io1NJQD8iyk_MO24FWxg59UMyKyac2MyHfWlDKtr_BeI_QL-6_IGoxTP7Fj312T3vk3O65YJmN2I8YtMyys',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIntroductionItem(
                      isDark,
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: isDark ? Colors.grey.shade300 : const Color(0xFF374151),
                          ),
                          children: [
                            TextSpan(text: 'Ady Purna Kurniawan ', style: const TextStyle(fontWeight: FontWeight.w500)),
                            const WidgetSpan(
                              child: Icon(Icons.arrow_forward, size: 14, color: Colors.grey),
                              alignment: PlaceholderAlignment.middle,
                            ),
                            const TextSpan(text: ' ADY', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildIntroductionItem(
                      isDark,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-mail:',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            'adypurnakurniawan@telkomuniversity.ac.id',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: isDark ? Colors.grey.shade400 : const Color(0xFF4B5563),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildIntroductionItem(
                      isDark,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bidang Keahlian:',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ...['– Information System', '– Web Programming and Design', '– Game Development'].map(
                            (item) => Text(
                              item,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: isDark ? Colors.grey.shade400 : const Color(0xFF4B5563),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildIntroductionItem(
                      isDark,
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: isDark ? Colors.grey.shade300 : const Color(0xFF374151),
                          ),
                          children: [
                            TextSpan(text: 'No.HP: ', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const TextSpan(text: '085727930642 '),
                            const WidgetSpan(
                              child: Icon(Icons.arrow_forward, size: 14, color: Colors.grey),
                              alignment: PlaceholderAlignment.middle,
                            ),
                            const TextSpan(text: '\nSMS/Telp/Whatsapp'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIntroductionItem(bool isDark, Widget content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '•',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: content),
      ],
    );
  }

  Widget _buildUISection(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          Text(
            'User Interface',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 20),
          _buildBulletItem(
            isDark,
            RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: isDark ? Colors.grey.shade300 : const Color(0xFF374151),
                  height: 1.6,
                ),
                children: [
                  const TextSpan(text: 'Antarmuka/ '),
                  TextSpan(text: 'user interface ', style: GoogleFonts.inter(fontStyle: FontStyle.italic, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: '(UI) merupakan bagian dari komputer dan perangkat lunaknya yang dapat '),
                  TextSpan(text: 'dilihat', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: ', '),
                  TextSpan(text: 'didengar', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: ', '),
                  TextSpan(text: 'disentuh', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: ', dan '),
                  TextSpan(text: 'diajak bicara', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: ', baik secara langsung maupun dengan proses pemahaman tertentu.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildBulletItem(
            isDark,
            RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: isDark ? Colors.grey.shade300 : const Color(0xFF374151),
                  height: 1.6,
                ),
                children: [
                  const TextSpan(text: 'UI yang baik adalah UI yang '),
                  TextSpan(text: 'tidak disadari', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: ', dan UI yang memungkinkan pengguna fokus pada informasi dan '),
                  TextSpan(text: 'task ', style: GoogleFonts.inter(fontStyle: FontStyle.italic, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: 'tanpa perlu mengetahui mekanisme untuk menampilkan informasi dan melakukan '),
                  TextSpan(text: 'task ', style: GoogleFonts.inter(fontStyle: FontStyle.italic, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: 'tersebut.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildBulletItem(
            isDark,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Komponen utamanya:',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '– Input\n– Output',
                  style: GoogleFonts.inter(color: isDark ? Colors.grey.shade400 : const Color(0xFF4B5563)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImportanceSection(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          Text(
            'Pentingnya Desain UI yang Baik',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 24),
          _buildBulletItem(
            isDark,
            RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: isDark ? Colors.grey.shade300 : const Color(0xFF374151),
                  height: 1.6,
                ),
                children: [
                  const TextSpan(text: 'Banyak sistem dengan fungsionalitas yang baik tapi tidak efisien, membingungkan, dan tidak berguna karena '),
                  TextSpan(text: 'desain UI yang buruk', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildBulletItem(
            isDark,
            Text(
              'Antarmuka yang baik merupakan jendela untuk melihat kemampuan sistem serta jembatan bagi kemampuan perangkat lunak.',
              style: GoogleFonts.inter(fontSize: 14, color: isDark ? Colors.grey.shade300 : const Color(0xFF374151), height: 1.6),
            ),
          ),
          const SizedBox(height: 16),
          _buildBulletItem(
            isDark,
            RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: isDark ? Colors.grey.shade300 : const Color(0xFF374151),
                  height: 1.6,
                ),
                children: [
                  const TextSpan(text: 'Desain yang buruk akan '),
                  TextSpan(text: 'membingungkan', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: ', '),
                  TextSpan(text: 'tidak efisien', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: ', bahkan menyebabkan '),
                  TextSpan(text: 'frustasi', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Frustrated User Image
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 180,
              height: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: isDark ? const Color(0xFF374151) : Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuD6MOVR1SCZTCZ976-6N_yHCXi-KXida24DprZXQ3Sm6lVC055xoxes31YT9N1wbo8tVI4-1LO3XFA6W0B6THahp29mqnfLZ4atWHZbtOc0hgPnvW3UDR0crs1eqlHqjS9zW0-uCriqnTes_vQ0AOECpF0niWNGBynoOkLR8ve7XuNy4yL8ZT0rZhd5CFxZbUB5iy5d_SF5JlgY90PxvjpETErdZ1XmodxOKAGMgT8REP2MK0svLc7J4B3GfRhBAnDvLndEtNqRi-U',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletItem(bool isDark, Widget content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            '•',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: content),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.withOpacity(0.2),
      indent: 24,
      endIndent: 24,
      thickness: 1,
    );
  }
}
