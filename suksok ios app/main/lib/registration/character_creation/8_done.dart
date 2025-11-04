import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../home.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            // Background (solid white - no placeholder image)
            Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.white,
            ),

            // Logo area (top left)
            Positioned(
              left: screenWidth * 0.067, // Equivalent to 51/371 = ~13.7%
              top: screenHeight * 0.083, // Equivalent to 62/748 = ~8.3%
              child: SvgPicture.asset(
                'assets/logo2.svg',
                width: screenWidth * 0.075, // Equivalent to 28/371 = ~7.5%
                height: screenHeight * 0.039, // Equivalent to 29.17/748 = ~3.9%
              ),
            ),

            // Main instruction text
            Positioned(
              left: screenWidth * 0.067, // Equivalent to 52/371 = ~14%
              top: screenHeight * 0.172, // Equivalent to 129/748 = ~17.2%
              child: Text(
                '와! 캐릭터가 깨어났어요!',
                style: TextStyle(
                  color: const Color(0xFF007BEB),
                  fontSize: screenWidth * 0.0485, // Responsive font size
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.40,
                  letterSpacing: -0.37,
                ),
              ),
            ),

            // Character face with orange character (middle)
            Positioned(
              left: screenWidth * 0.205, // Equivalent to 76/371 = ~20.5%
              top: screenHeight * 0.370, // Equivalent to 277/748 = ~37%
              child: SvgPicture.asset(
                'assets/open_eyes.svg',
                width: screenWidth * 0.591, // Equivalent to 219.03/371 = ~59.1%
                height: screenHeight * 0.259, // Equivalent to 193.66/748 = ~25.9%
              ),
            ),

            // Blue button at bottom
            Positioned(
              left: screenWidth * 0.273, // Center the button
              top: screenHeight * 0.85, // Position at bottom
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                child: Container(
                  width: screenWidth * 0.455,
                  height: screenHeight * 0.057,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF007BEB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21.27),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '시작하기',
                      style: TextStyle(
                        color: const Color(0xFFF8F8F8),
                        fontSize: screenWidth * 0.038,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0.84,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}