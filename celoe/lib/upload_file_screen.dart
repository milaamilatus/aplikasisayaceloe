import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  String? _selectedFileName;
  bool _isUploading = false;

  void _simulateFilePicker() {
    setState(() {
      _selectedFileName = "Amilatus sholehah.pdf";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('File terpilih: Amilatus sholehah.pdf')),
    );
  }

  void _simulateSave() async {
    if (_selectedFileName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan pilih file terlebih dahulu')),
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tugas berhasil diunggah!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context, _selectedFileName);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryRed = const Color(0xFFB94A48);
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final surfaceColor = isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF8F9FA);
    final borderColor = isDark ? const Color(0xFF404040) : Colors.black;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xFFF3F4F6),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Header
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(top: 14, bottom: 20),
                  decoration: BoxDecoration(
                    color: primaryRed,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Upload File',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Maksimum File 5MB , Maksimum Jumlah File 20',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: isDark ? const Color(0xFFD1D5DB) : const Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        // Upload Box
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Container(
                            height: 256,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF2D2D2D).withOpacity(0.3) : const Color(0xFFF9FAFB).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: _DashedBorderContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_selectedFileName != null) ...[
                                    const Icon(Icons.description_rounded, size: 80, color: Color(0xFF3CA0D9)),
                                    const SizedBox(height: 16),
                                    Text(
                                      _selectedFileName!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: isDark ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ] else ...[
                                    _buildCloudIcon(),
                                    const SizedBox(height: 16),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        'File yang akan di upload akan tampil di sini',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: isDark ? Colors.white : Colors.black,
                                          height: 1.3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),

                        const Spacer(),

                        // Buttons
                        _buildButton(
                          'Pilih File',
                          surfaceColor,
                          isDark ? Colors.white : Colors.black,
                          isDark,
                          onPressed: _simulateFilePicker,
                        ),
                        const SizedBox(height: 20),
                        _buildButton(
                          _isUploading ? 'Menyimpan...' : 'Simpan',
                          surfaceColor,
                          isDark ? Colors.white : Colors.black,
                          isDark,
                          onPressed: _isUploading ? null : _simulateSave,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCloudIcon() {
    return SizedBox(
      width: 120,
      height: 90,
      child: Stack(
        children: [
          const Positioned(
            child: Icon(
              Icons.cloud,
              size: 110,
              color: Color(0xFF3CA0D9),
            ),
          ),
          const Positioned(
            top: 25,
            left: 35,
            child: Icon(
              Icons.arrow_upward_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, bool isDark, {VoidCallback? onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: isDark ? const Color(0xFF404040) : Colors.transparent,
            ),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _DashedBorderContainer extends StatelessWidget {
  final Widget child;

  const _DashedBorderContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedPainter(
        color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF6B7280) : const Color(0xFF9CA3AF),
      ),
      child: child,
    );
  }
}

class _DashedPainter extends CustomPainter {
  final Color color;

  _DashedPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 8.0;
    const dashSpace = 6.0;

    // Top
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }

    // Bottom
    startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, size.height), Offset(startX + dashWidth, size.height), paint);
      startX += dashWidth + dashSpace;
    }

    // Left
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }

    // Right
    startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(size.width, startY), Offset(size.width, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
