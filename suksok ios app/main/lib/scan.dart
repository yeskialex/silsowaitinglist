import 'package:flutter/material.dart';

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

            // Character figures placeholder - centered
            Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.35,
              bottom: screenHeight * 0.15,
              child: Center(
                child: Text(
                  '캐릭터 이미지 영역\n(이미지는 나중에 추가)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
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
                    // Handle scan start action
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
}