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
                      fontSize: screenWidth * 0.03,
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

                      // Progress bar
                      Positioned(
                        left: screenWidth * 0.0675, // 17/371 (relative to card) - 69-52=17
                        top: screenHeight * 0.045, // 34/748 (relative to card) - 473-439=34
                        child: Container(
                          width: screenWidth * 0.628, // 233/371
                          height: screenHeight * 0.0067, // 5/748
                          decoration: ShapeDecoration(
                            color: const Color(0xFFE4E1E1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.37),
                            ),
                          ),
                        ),
                      ),

                      // Category labels with exact positioning
                      Positioned(
                        left: screenWidth * 0.0675, // 17/371 (relative to card) - 69-52=17
                        top: screenHeight * 0.063, // 47/748 (relative to card) - 486-439=47
                        child: Text(
                          '떼쓰기',
                          style: TextStyle(
                            color: const Color(0xFF007BEB),
                            fontSize: screenWidth * 0.0216, // 8/371
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.342, // 127/371 (relative to card) - 179-52=127
                        top: screenHeight * 0.063, // 47/748 (relative to card) - 486-439=47
                        child: Text(
                          '진정',
                          style: TextStyle(
                            color: const Color(0xFF007BEB),
                            fontSize: screenWidth * 0.0216, // 8/371
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.636, // 236/371 (relative to card) - 288-52=236
                        top: screenHeight * 0.063, // 47/748 (relative to card) - 486-439=47
                        child: Text(
                          '교육',
                          style: TextStyle(
                            color: const Color(0xFF007BEB),
                            fontSize: screenWidth * 0.0216, // 8/371
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ),

                      // Bottom message
                      Positioned(
                        left: screenWidth * 0.0675, // 17/371 (relative to card) - 69-52=17
                        top: screenHeight * 0.126, // 94/748 (relative to card) - 533-439=94
                        child: SizedBox(
                          width: screenWidth * 0.644, // 239/371
                          child: Text(
                            '측정 데이터가 없습니다!',
                            style: TextStyle(
                              color: const Color(0xFF007BEB),
                              fontSize: screenWidth * 0.0324, // 12/371
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