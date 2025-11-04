import 'package:flutter/material.dart';
import 'scan_swipe.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color(0xFF007BEB),
            size: 18,
          ),
        ),
        title: Text(
          '성장스캔',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF007BEB),
            letterSpacing: -0.72,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Main explanatory text
            Positioned(
              left: screenWidth * 0.11,
              top: screenHeight * 0.04,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF007BEB),
                    height: 1.2,
                  ),
                  children: [
                    const TextSpan(text: '최근 사진들을 분석하여\n'),
                    const TextSpan(text: '우리 아이의 '),
                    TextSpan(
                      text: '현재 성장상태',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(text: '를\n'),
                    const TextSpan(text: '확인할 수 있어요!'),
                  ],
                ),
              ),
            ),

            // Character figures - centered
            Positioned(
              left: screenWidth * 0.05,
              right: -screenWidth * 0.05,
              top: screenHeight * 0.25,
              bottom: screenHeight * 0.15,
              child: Center(
                child: Image.asset(
                  'assets/liningup.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Bottom action button
            Positioned(
              left: screenWidth * 0.2385,
              bottom: screenHeight * 0.054,
              child: SizedBox(
                width: screenWidth * 0.523,
                height: screenHeight * 0.057,
                child: ElevatedButton(
                  onPressed: () {
                    _showHealthReportDialog(context);
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
                    '시작하기',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Pretendard',
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

  void _showHealthReportDialog(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.054),
          child: Container(
            width: screenWidth * 0.72,
            height: screenHeight * 0.265,
            decoration: ShapeDecoration(
              color: const Color(0xFF007BEB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.37),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title text
                Text(
                  '민준이의 건강기록이\n도착했어요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: screenWidth * 0.0485,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFF8F8F8),
                    height: 1.44,
                  ),
                ),

                SizedBox(height: screenHeight * 0.015),

                // Date range
                Text(
                  '7월 10일-7월 24일',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: screenWidth * 0.0324,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFF8F8F8),
                  ),
                ),

                SizedBox(height: screenHeight * 0.025),

                // Confirm button
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScanSwipeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.59,
                    height: screenHeight * 0.059,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF8F8F8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '확인하기',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: screenWidth * 0.0405,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF007BEB),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}