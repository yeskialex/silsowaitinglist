import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Stack(
          children: [
            // // Orange character positioned at top right
            // Positioned(
            //   right: screenWidth * 0.1,
            //   top: screenHeight * 0.05,
            //   child: Transform.rotate(
            //     angle: -0.01,
            //     child: SvgPicture.asset(
            //       'assets/character_at_home.svg',
            //       width: screenWidth * 0.25,
            //       height: screenHeight * 0.16,
            //     ),
            //   ),
            // ),

            // Main content column
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.054),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  // Status bar icons (top right)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: screenWidth * 0.044,
                        height: screenHeight * 0.017,
                      ),
                      SizedBox(width: screenWidth * 0.004),
                      Container(
                        width: screenWidth * 0.035,
                        height: screenHeight * 0.017,
                      ),
                      SizedBox(width: screenWidth * 0.004),
                      Container(
                        width: screenWidth * 0.055,
                        height: screenHeight * 0.017,
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Logo
                  SvgPicture.asset(
                    'assets/logo2.svg',
                    width: screenWidth * 0.0755,
                    height: screenHeight * 0.0390,
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Main title
                  Text(
                    '민준이는\n오늘도 열심히 성장중이에요!',
                    style: TextStyle(
                      color: const Color(0xFF007BEB),
                      fontSize: screenWidth * 0.0485,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Blue dashboard card with overlaid buttons
                  Stack(
                    children: [
                      // Main blue container
                      Container(
                        width: screenWidth * 0.89,
                        height: screenHeight * 0.287,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF007BEB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.37),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.035),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '현재 민준이는',
                                style: TextStyle(
                                  color: const Color(0xFFF8F8F8),
                                  fontSize: screenWidth * 0.027,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.003),

                              Text(
                                '쑥쏙 단계 2입니다',
                                style: TextStyle(
                                  color: const Color(0xFFFFD724),
                                  fontSize: screenWidth * 0.0593,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.010),

                              Text(
                                '쑥쏙 단계가 1단계 상승했습니다. 잘 하고 있어요!\n지금처럼 건강 습관을 유지하는 것이 더 중요합니다.',
                                style: TextStyle(
                                  color: const Color(0xFFF8F8F8),
                                  fontSize: screenWidth * 0.03,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.40,
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.040),

                              // Progress bar
                              Stack(
                                clipBehavior: Clip.none, // Allow overflow
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.007,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFE4E1E1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.37),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth * 0.16,
                                    height: screenHeight * 0.007,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFFFD724),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.37),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: screenWidth * 0.125,
                                    top: -screenHeight * 0.006,
                                    child: Container(
                                      width: screenWidth * 0.04,
                                      height: screenWidth * 0.04, // Make it a perfect circle
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFFFD724),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: screenHeight * 0.003),

                              // Progress numbers
                              SizedBox(
                                height: screenHeight * 0.025,
                                child: Stack(
                                  children: [
                                    // "2" positioned directly below the yellow circle
                                    Positioned(
                                      left: screenWidth * 0.135,
                                      top: screenHeight * 0.003,
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                          color: const Color(0xFFFFD724),
                                          fontSize: screenWidth * 0.0324,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    // "10" at the end
                                    Positioned(
                                      right: 0,
                                      top: screenHeight * 0.003,
                                      child: Text(
                                        '10',
                                        style: TextStyle(
                                          color: const Color(0xFFFFD724),
                                          fontSize: screenWidth * 0.0324,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Overlaid buttons at the bottom
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF007BEB),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.37),
                              bottomRight: Radius.circular(8.37),
                            ),
                          ),
                          child: Column(
                            children: [
                              // Divider
                              Container(
                                width: double.infinity,
                                height: 0.5,
                                color: const Color(0xFFF8F8F8),
                              ),

                              // Bottom buttons
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        // Handle 이전결과 button press
                                        print('이전결과 pressed');
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                                        splashFactory: InkRipple.splashFactory,
                                      ),
                                      child: Text(
                                        '이전결과',
                                        style: TextStyle(
                                          color: const Color(0xFFF8F8F8),
                                          fontSize: screenWidth * 0.03,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.72,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 0.5,
                                    height: screenHeight * 0.03,
                                    color: const Color(0xFFF8F8F8),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        // Handle 성장스캔 button press
                                        print('성장스캔 pressed');
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                                        splashFactory: InkRipple.splashFactory,
                                      ),
                                      child: Text(
                                        '성장스캔',
                                        style: TextStyle(
                                          color: const Color(0xFFF8F8F8),
                                          fontSize: screenWidth * 0.03,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.72,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Section title
                  Text(
                    '평균 떼 지속시간',
                    style: TextStyle(
                      color: const Color(0xFF007BEB),
                      fontSize: screenWidth * 0.035,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      height: 1.40,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Bottom card stack (layered effect) - responsive version of reference
                  SizedBox(
                    height: screenHeight * 0.22, // Give Stack explicit height
                    child: Stack(
                      children: [
                      // Back layer
                      Positioned(
                        top: screenHeight * 0.042, // Lowered back layer slightly
                        child: Container(
                          width: screenWidth * 0.89, // 267/371 (adjusted to match dashboard width)
                          height: screenHeight * 0.156, // 117/748
                          decoration: ShapeDecoration(
                            color: const Color(0x1A007BEB), // 10% opacity
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.37),
                            ),
                          ),
                        ),
                      ),
                      // Middle layer
                      Positioned(
                        top: screenHeight * 0.020, // Adjusted for better layered effect
                        child: Container(
                          width: screenWidth * 0.89, // 267/371 (adjusted to match dashboard width)
                          height: screenHeight * 0.166, // 124/748
                          decoration: ShapeDecoration(
                            color: const Color(0x26007BEB), // 15% opacity
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.37),
                            ),
                          ),
                        ),
                      ),
                      // Front layer - main white container
                      Container(
                        width: screenWidth * 0.89, // 267/371 (adjusted to match dashboard width)
                        height: screenHeight * 0.172, // 129/748
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.37),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 4,
                              offset: Offset(2, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),

                      // Time values above progress bar
                      Positioned(
                        left: screenWidth * 0.0675, // Left edge aligned with progress bar
                        top: screenHeight * 0.023, // Above the progress bar
                        child: Text(
                          '2:39',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: screenWidth * 0.027,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF007BEB),
                          ),
                        ),
                      ),

                      // Time value above first circle (calm section)
                      Positioned(
                        left: ((screenWidth * 0.755) * 0.35), // No offset - aligned with circle position
                        top: screenHeight * 0.023,
                        child: Text(
                          '0:54',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: screenWidth * 0.027,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF007BEB),
                          ),
                        ),
                      ),

                      // Time value above second circle (education section)
                      Positioned(
                        left: ((screenWidth * 0.755) * 0.55), // No offset - aligned with circle position
                        top: screenHeight * 0.023,
                        child: Text(
                          '3:02',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: screenWidth * 0.027,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF007BEB),
                          ),
                        ),
                      ),

                      // Progress bar with segments and circles
                      Positioned(
                        left: screenWidth * 0.0675, // 17/371 (relative to card) - 69-52=17
                        top: screenHeight * 0.045, // 34/748 (relative to card) - 473-439=34
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Background bar
                            Container(
                              width: screenWidth * 0.755, // Adjusted to fit properly within white card
                              height: screenHeight * 0.0067, // 5/748
                              decoration: ShapeDecoration(
                                color: const Color(0xFFE4E1E1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.37),
                                ),
                              ),
                            ),

                            // Tantrum section (light blue)
                            Container(
                              width: (screenWidth * 0.755) * 0.25, // 25% of progress bar
                              height: screenHeight * 0.0067,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFC9E5FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.37),
                                ),
                              ),
                            ),

                            // Calm section (medium blue)
                            Positioned(
                              left: (screenWidth * 0.755) * 0.25,
                              child: Container(
                                width: (screenWidth * 0.755) * 0.2, // 20% of progress bar (reduced from 35%)
                                height: screenHeight * 0.0067,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF73BCFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.37),
                                  ),
                                ),
                              ),
                            ),

                            // Education section (dark blue)
                            Positioned(
                              left: (screenWidth * 0.755) * 0.45,
                              child: Container(
                                width: (screenWidth * 0.755) * 0.55, // 55% of progress bar (increased from 40%)
                                height: screenHeight * 0.0067,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF007BEB),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.37),
                                  ),
                                ),
                              ),
                            ),

                            // Circle at the end of tantrum section
                            Positioned(
                              left: ((screenWidth * 0.755) * 0.25) - screenWidth * 0.015,
                              top: -screenHeight * 0.0033,
                              child: Container(
                                width: screenWidth * 0.03,
                                height: screenWidth * 0.03,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFC9E5FF),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),

                            // Circle at the end of calm section
                            Positioned(
                              left: ((screenWidth * 0.755) * 0.45) - screenWidth * 0.015,
                              top: -screenHeight * 0.0033,
                              child: Container(
                                width: screenWidth * 0.03,
                                height: screenWidth * 0.03,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF73BCFF),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),

                            // Circle at the end of education section
                            Positioned(
                              left: (screenWidth * 0.755) - screenWidth * 0.015,
                              top: -screenHeight * 0.0033,
                              child: Container(
                                width: screenWidth * 0.03,
                                height: screenWidth * 0.03,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF007BEB),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Category labels with exact positioning
                      Positioned(
                        left: screenWidth * 0.0675, // Left edge
                        top: screenHeight * 0.063, // 47/748 (relative to card) - 486-439=47
                        child: Text(
                          '떼쓰기',
                          style: TextStyle(
                            color: const Color(0xFF007BEB),
                            fontSize: screenWidth * 0.03, // 8/371
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.23, // Center position
                        top: screenHeight * 0.063, // 47/748 (relative to card) - 486-439=47
                        child: Text(
                          '진정',
                          style: TextStyle(
                            color: const Color(0xFF007BEB),
                            fontSize: screenWidth * 0.03, // 8/371
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.39, // Right edge
                        top: screenHeight * 0.063, // 47/748 (relative to card) - 486-439=47
                        child: Text(
                          '교육',
                          style: TextStyle(
                            color: const Color(0xFF007BEB),
                            fontSize: screenWidth * 0.03, // 8/371
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ),

                      // Bottom message
                      Positioned(
                        left: screenWidth * 0.0675, // 17/371 (relative to card) - 69-52=17
                        top: screenHeight * 0.1, // 94/748 (relative to card) - 533-439=94
                        child: SizedBox(
                          width: screenWidth * 0.644, // 239/371
                          child: Text(
                            '떼쓰기 시간 5% 감소!\n아이의 이해도가 올라가고 있어요.',
                            style: TextStyle(
                              color: const Color(0xFF007BEB),
                              fontSize: screenWidth * 0.035, // 12/371
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.40,
                            ),
                          ),
                        ),
                      ),
                      ],
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