import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScanSwipeScreen extends StatefulWidget {
  const ScanSwipeScreen({super.key});

  @override
  State<ScanSwipeScreen> createState() => _ScanSwipeScreenState();
}

class _ScanSwipeScreenState extends State<ScanSwipeScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  final List<String> _dates = ['7월 10일', '7월 17일', '7월 24일'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.054),
          child: SvgPicture.asset(
            'assets/logo2.svg',
            width: screenWidth * 0.05,
            height: screenHeight * 0.025,
          ),
        ),
        leadingWidth: screenWidth * 0.2,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),

            // Title and date section with padding
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.054),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    const TextSpan(text: '최근 2주 '),
                    TextSpan(
                      text: '민준이의 변화',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(text: '입니다!'),
                  ],
                ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // Date range
                  Text(
                    '7월 10일-7월 24일',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: screenWidth * 0.0324,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF767676),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.06),

              // Photo gallery with swipe functionality
              Expanded(
                child: Column(
                  children: [
                    // Photos
                    SizedBox(
                      height: screenHeight * 0.5,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return _buildPhotoItem(index, screenWidth, screenHeight);
                        },
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Date indicator for current photo
                    Text(
                      _dates[_currentIndex],
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF007BEB),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Bottom button with padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.054),
                child: Center(
                  child: SizedBox(
                    width: screenWidth * 0.523,
                    height: screenHeight * 0.057,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle photo analysis action
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
                        '사진 분석 보기',
                        style: TextStyle(
                          fontSize: screenWidth * 0.0378,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoItem(int index, double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.37),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.37),
        child: Image.asset(
          index == 1 ? 'assets/example2.png' : 'assets/example_picture.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFFF5F5F5),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: screenWidth * 0.15,
                  color: const Color(0xFFA2A2A2),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}