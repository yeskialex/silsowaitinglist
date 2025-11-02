import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'level2.dart';
import 'scan_records.dart';

class ScanAnalysisScreen extends StatelessWidget {
  const ScanAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Logo on top left
            Positioned(
              left: screenWidth * 0.054,
              top: screenHeight * 0.02,
              child: SvgPicture.asset(
                'assets/logo2.svg',
                width: screenWidth * 0.08,
                height: screenHeight * 0.04,
              ),
            ),

            // Main content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.054),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.08),

                  // Title text
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: screenWidth * 0.0485,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF007BEB),
                    height: 1.4,
                  ),
                  children: [
                    const TextSpan(text: '쑥쑥이의 '),
                    TextSpan(
                      text: '건강한 변화',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(text: '가 보이네요!\n'),
                    const TextSpan(text: '아이의 몸과 마음이 함께 자라나고 있어요.'),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.08),

              // Photo comparison section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Before photo
                  Column(
                    children: [
                      Container(
                        width: screenWidth * 0.34,
                        height: screenHeight * 0.29,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.37),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.37),
                          child: Image.asset(
                            'assets/example_picture.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFF5F5F5),
                                child: Center(
                                  child: Icon(
                                    Icons.image,
                                    size: screenWidth * 0.1,
                                    color: const Color(0xFFA2A2A2),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Text(
                        '7월 10일',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF007BEB),
                        ),
                      ),
                    ],
                  ),

                  // Arrow icon
                  Icon(
                    Icons.arrow_forward,
                    color: const Color(0xFF007BEB),
                    size: screenWidth * 0.06,
                  ),

                  // After photo
                  Column(
                    children: [
                      Container(
                        width: screenWidth * 0.34,
                        height: screenHeight * 0.29,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.37),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.37),
                          child: Image.asset(
                            'assets/example2.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFF5F5F5),
                                child: Center(
                                  child: Icon(
                                    Icons.image,
                                    size: screenWidth * 0.1,
                                    color: const Color(0xFFA2A2A2),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Text(
                        '7월 24일',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF007BEB),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              // Bottom buttons
              Center(
                child: Column(
                  children: [
                    // 변화 기록 보기 button (gray)
                    SizedBox(
                      width: screenWidth * 0.523,
                      height: screenHeight * 0.057,
                      child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScanRecordsScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB7B7B7),
                        foregroundColor: const Color(0xFFF8F8F8),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21.27),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        '변화 기록 보기',
                        style: TextStyle(
                          fontSize: screenWidth * 0.0378,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.015),

                  // 완료하기 button (blue)
                  SizedBox(
                    width: screenWidth * 0.523,
                    height: screenHeight * 0.057,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007BEB),
                        foregroundColor: const Color(0xFFF8F8F8),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21.27),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        '완료하기',
                        style: TextStyle(
                          fontSize: screenWidth * 0.0378,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}