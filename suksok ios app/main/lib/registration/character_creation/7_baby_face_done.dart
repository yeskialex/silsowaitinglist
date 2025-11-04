import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '8_done.dart';

class BabyFaceDoneScreen extends StatefulWidget {
  const BabyFaceDoneScreen({super.key});

  @override
  State<BabyFaceDoneScreen> createState() => _BabyFaceDoneScreenState();
}

class _BabyFaceDoneScreenState extends State<BabyFaceDoneScreen> {
  @override
  void initState() {
    super.initState();
    // Auto-navigate to next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const DoneScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      }
    });
  }

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
                '쑥쏙이가 깨어났어요!\n이제 함께 놀아보아요!',
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

            // Baby face with open eyes (middle)
            Positioned(
              left: screenWidth * 0.205, // Equivalent to 76/371 = ~20.5%
              top: screenHeight * 0.370, // Equivalent to 277/748 = ~37%
              child: SvgPicture.asset(
                'assets/closed_eyes.svg',
                width: screenWidth * 0.591, // Equivalent to 219.03/371 = ~59.1%
                height: screenHeight * 0.259, // Equivalent to 193.66/748 = ~25.9%
              ),
            ),

            // Text above mic button
            Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.76, // Positioned above the mic button
              child: Center(
                child: Text(
                  '완료!',
                  style: TextStyle(
                    color: const Color(0xFF007BEB),
                    fontSize: screenWidth * 0.055, // Responsive font size
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.37,
                  ),
                ),
              ),
            ),

            // Completion button (bottom center) - check mark in circle
            Positioned(
              left: screenWidth * 0.425,
              top: screenHeight * 0.83,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/circle.svg',
                    width: screenWidth * 0.151,
                    height: screenWidth * 0.151,
                  ),
                  SvgPicture.asset(
                    'assets/check.svg',
                    width: screenWidth * 0.08,
                    height: screenWidth * 0.08,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}