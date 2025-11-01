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
      backgroundColor: Colors.white,
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
                    '쑥쏙이는\n오늘도 열심히 성장중이에요!',
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
                                '쑥쏙 단계 1입니다',
                                style: TextStyle(
                                  color: const Color(0xFFFFD724),
                                  fontSize: screenWidth * 0.0593,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.010),

                              Text(
                                '민준이는 체질량지수가 높은 편이에요!\n민준이의 건강한 성장을 위해 함께 노력해요.',
                                style: TextStyle(
                                  color: const Color(0xFFF8F8F8),
                                  fontSize: screenWidth * 0.027,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.40,
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.040),

                              // Progress bar
                              Stack(
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
                                    width: screenWidth * 0.08,
                                    height: screenHeight * 0.007,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFFFD724),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.37),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: screenWidth * 0.06,
                                    top: -screenHeight * 0.003,
                                    child: Container(
                                      width: screenWidth * 0.024,
                                      height: screenHeight * 0.012,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      color: const Color(0xFFFFD724),
                                      fontSize: screenWidth * 0.0324,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: const Color(0xFFFFD724),
                                      fontSize: screenWidth * 0.0324,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
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
                      fontSize: screenWidth * 0.027,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      height: 1.40,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Bottom card stack (layered effect)
                  Stack(
                    children: [
                      // Back layer
                      Positioned(
                        top: screenHeight * 0.021,
                        child: Container(
                          width: screenWidth * 0.89,
                          height: screenHeight * 0.156,
                          decoration: ShapeDecoration(
                            color: const Color(0x26007BEB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.37),
                            ),
                          ),
                        ),
                      ),
                      // Middle layer
                      Positioned(
                        top: screenHeight * 0.01,
                        child: Container(
                          width: screenWidth * 0.89,
                          height: screenHeight * 0.166,
                          decoration: ShapeDecoration(
                            color: const Color(0x19007BEB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.37),
                            ),
                          ),
                        ),
                      ),
                      // Front layer
                      Container(
                        width: screenWidth * 0.89,
                        height: screenHeight * 0.172,
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
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.045),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Progress bar
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

                              SizedBox(height: screenHeight * 0.015),

                              // Category labels
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '떼쓰기',
                                    style: TextStyle(
                                      color: const Color(0xFF007BEB),
                                      fontSize: screenWidth * 0.0216,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 1.40,
                                    ),
                                  ),
                                  Text(
                                    '진정',
                                    style: TextStyle(
                                      color: const Color(0xFF007BEB),
                                      fontSize: screenWidth * 0.0216,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 1.40,
                                    ),
                                  ),
                                  Text(
                                    '교육',
                                    style: TextStyle(
                                      color: const Color(0xFF007BEB),
                                      fontSize: screenWidth * 0.0216,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 1.40,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: screenHeight * 0.035),

                              // Bottom message
                              Text(
                                '측정 데이터가 없습니다!',
                                style: TextStyle(
                                  color: const Color(0xFF007BEB),
                                  fontSize: screenWidth * 0.0324,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 1.40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }
}