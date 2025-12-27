import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_screen.dart';
import 'home_screen.dart';
import 'help_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine if we are in dark mode (as suggested by the HTML script)
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF1F1F1F) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF333333);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Header Section with Image and SVG layers
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * 0.35 < 250 ? 250 : constraints.maxHeight * 0.35,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Image.network(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuABsUp9MSkq0nuWWIJG8ytLpMuVzaA-TFrQHQbs6sOWAKihBj9G9R43O-Jna0H3PZEq99mgOds9eim_5TEDS4ngCHdCKDROgosb0fdeY7-UhVZXG84CK2eRMg5LjSlemQppvngdPIDh6cp5lV94jhDKH4G6WOmRwnPHoRTX2jb51-Zl4H_PTQKAbplZ_su3aHKNLMZITXhNbWVHHhAxzGnfJfclmOq4TXiD65bEOjKA1S7VKZ0F0N8bID32x6F1yEvDAT_s8O_Bm84',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.1),
                              ),
                              // Accurate SVG Path Divider (Overlaying the image)
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: CustomPaint(
                                  size: const Size(double.infinity, 120),
                                  painter: HeaderDividerPainter(fillColor: backgroundColor),
                                ),
                              ),
                              // Slanted cut at the very bottom of image area
                              Positioned(
                                bottom: -1,
                                left: 0,
                                right: 0,
                                child: ClipPath(
                                  clipper: HeaderSlantClipper(),
                                  child: Container(
                                    height: 64,
                                    color: backgroundColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Floating Icon
                        Positioned(
                          bottom: -40,
                          left: constraints.maxWidth / 2 - 40,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xFFA63434),
                              shape: BoxShape.circle,
                              border: Border.all(color: backgroundColor, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.local_library,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 60),

                    // Login Form
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 32),
                          TextField(
                            controller: _emailController,
                            style: GoogleFonts.poppins(color: textColor),
                            decoration: InputDecoration(
                              labelText: 'Email 365',
                              labelStyle: GoogleFonts.poppins(
                                color: isDark ? Colors.grey[400] : Colors.grey[500],
                                fontWeight: FontWeight.w600,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFA63434), width: 2),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF8B2B2B), width: 2),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            style: GoogleFonts.poppins(color: textColor),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: GoogleFonts.poppins(
                                color: isDark ? Colors.grey[400] : Colors.grey[500],
                                fontWeight: FontWeight.w600,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFA63434), width: 2),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF8B2B2B), width: 2),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: isDark ? Colors.grey[200] : Colors.grey[800],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 48),
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFA63434),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                elevation: 5,
                              ),
                              child: Text(
                                'Log In',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HelpScreen()),
                                );
                              },
                              child: Text(
                                'Bantuan ?',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFA63434),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // Footer Section with Triple-layer waves
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomPaint(
                            size: const Size(double.infinity, 150),
                            painter: FooterWavesPainter(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeaderSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HeaderDividerPainter extends CustomPainter {
  final Color fillColor;
  HeaderDividerPainter({required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    double sw = size.width;
    double sh = size.height;

    // Path 1: Opacity 0.25
    paint.color = fillColor.withOpacity(0.25);
    Path p1 = Path();
    p1.moveTo(0, 0);
    p1.lineTo(0, sh * 0.38);
    p1.cubicTo(sw * 0.04, sh * 0.56, sw * 0.08, sh * 0.65, sw * 0.13, sh * 0.61);
    p1.cubicTo(sw * 0.19, sh * 0.57, sw * 0.24, sh * 0.34, sw * 0.3, sh * 0.3);
    p1.cubicTo(sw * 0.36, sh * 0.27, sw * 0.42, sh * 0.44, sw * 0.48, sh * 0.6);
    p1.cubicTo(sw * 0.54, sh * 0.75, sw * 0.6, sh * 0.8, sw * 0.66, sh * 0.7);
    p1.cubicTo(sw * 0.72, sh * 0.6, sw * 0.78, sh * 0.5, sw * 0.84, sh * 0.4);
    p1.cubicTo(sw * 0.9, sh * 0.3, sw * 0.96, sh * 0.1, sw, sh * 0.43);
    p1.lineTo(sw, 0);
    p1.close();
    canvas.drawPath(p1, paint);

    // Path 2: Opacity 0.5
    paint.color = fillColor.withOpacity(0.5);
    Path p2 = Path();
    p2.moveTo(0, 0);
    p2.lineTo(0, sh * 0.13);
    p2.cubicTo(sw * 0.01, sh * 0.3, sw * 0.04, sh * 0.42, sw * 0.08, sh * 0.5);
    p2.cubicTo(sw * 0.15, sh * 0.63, sw * 0.23, sh * 0.57, sw * 0.3, sh * 0.48);
    p2.cubicTo(sw * 0.38, sh * 0.39, sw * 0.45, sh * 0.28, sw * 0.53, sh * 0.41);
    p2.cubicTo(sw * 0.59, sh * 0.5, sw * 0.65, sh * 0.76, sw * 0.7, sh * 0.9);
    p2.cubicTo(sw * 0.76, sh * 1.04, sw * 0.82, sh * 1.05, sw * 0.88, sh * 0.93);
    p2.cubicTo(sw * 0.94, sh * 0.81, sw * 0.98, sh * 0.69, sw, sh * 0.6);
    p2.lineTo(sw, 0);
    p2.close();
    canvas.drawPath(p2, paint);

    // Path 3: Solid background (at the bottom)
    paint.color = fillColor;
    Path p3 = Path();
    p3.moveTo(0, sh * 5); // Huge block to cover everything
    p3.lineTo(0, sh);
    p3.lineTo(sw, sh);
    p3.lineTo(sw, sh * 5);
    p3.close();
    canvas.drawPath(p3, paint);

    // Path 4: Detailed Curve
    Path p4 = Path();
    p4.moveTo(sw * 0.26, sh * 0.47);
    p4.cubicTo(sw * 0.31, sh * 0.38, sw * 0.36, sh * 0.21, sw * 0.41, sh * 0.12);
    p4.cubicTo(sw * 0.48, sh * -0.02, sw * 0.55, sh * -0.03, sw * 0.62, sh * 0.12);
    p4.cubicTo(sw * 0.68, sh * 0.25, sw * 0.75, sh * 0.6, sw * 0.82, sh * 0.77);
    p4.cubicTo(sw * 0.88, sh * 0.93, sw * 0.94, sh * 0.99, sw, sh * 0.8);
    p4.lineTo(sw, sh);
    p4.lineTo(0, sh);
    p4.lineTo(0, sh * 0.8);
    p4.cubicTo(sw * 0.05, sh * 0.99, sw * 0.12, sh * 0.88, sw * 0.18, sh * 0.8);
    p4.cubicTo(sw * 0.21, sh * 0.76, sw * 0.24, sh * 0.69, sw * 0.26, sh * 0.47);
    p4.close();
    canvas.drawPath(p4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FooterWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    double sw = size.width;
    double sh = size.height;
    const Color primary = Color(0xFFA63434);

    // Layer 1: Bottom path from HTML (SVG with id 1440 320)
    paint.color = primary;
    Path p1 = Path();
    p1.moveTo(0, sh * 0.6);
    p1.lineTo(sw * 0.04, sh * 0.61);
    p1.cubicTo(sw * 0.08, sh * 0.63, sw * 0.16, sh * 0.66, sw * 0.25, sh * 0.71);
    p1.cubicTo(sw * 0.33, sh * 0.76, sw * 0.41, sh * 0.83, sw * 0.5, sh * 0.81);
    p1.cubicTo(sw * 0.58, sh * 0.8, sw * 0.66, sh * 0.7, sw * 0.75, sh * 0.66);
    p1.cubicTo(sw * 0.83, sh * 0.63, sw * 0.91, sh * 0.66, sw * 0.95, sh * 0.68);
    p1.lineTo(sw, sh * 0.7);
    p1.lineTo(sw, sh);
    p1.lineTo(0, sh);
    p1.close();
    canvas.drawPath(p1, paint);

    // Layer 2: Second path (middle wave)
    Path p2 = Path();
    p2.moveTo(0, sh * 0.3);
    p2.lineTo(sw * 0.03, sh * 0.35);
    p2.cubicTo(sw * 0.06, sh * 0.4, sw * 0.13, sh * 0.5, sw * 0.2, sh * 0.58);
    p2.cubicTo(sw * 0.26, sh * 0.66, sw * 0.33, sh * 0.73, sw * 0.4, sh * 0.7);
    p2.cubicTo(sw * 0.46, sh * 0.66, sw * 0.53, sh * 0.53, sw * 0.6, sh * 0.51);
    p2.cubicTo(sw * 0.66, sh * 0.5, sw * 0.73, sh * 0.6, sw * 0.8, sh * 0.66);
    p2.cubicTo(sw * 0.86, sh * 0.73, sw * 0.93, sh * 0.76, sw * 0.96, sh * 0.78);
    p2.lineTo(sw, sh * 0.8);
    p2.lineTo(sw, sh);
    p2.lineTo(0, sh);
    p2.close();
    canvas.drawPath(p2, paint);

    // Layer 3: Glassmorphism/Accent wave (from lowermost SVG 500 150)
    Path p3 = Path();
    p3.moveTo(0, sh * 0.33);
    p3.cubicTo(sw * 0.3, sh, sw * 0.69, -sh * 0.33, sw, sh * 0.33);
    p3.lineTo(sw, sh);
    p3.lineTo(0, sh);
    p3.close();
    canvas.drawPath(p3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
