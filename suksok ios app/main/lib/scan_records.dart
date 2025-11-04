import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'level2.dart';

class ScanRecordsScreen extends StatelessWidget {
  const ScanRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Sample records data
    final List<Map<String, String>> records = [
      {'date': '2.12-2.26', 'image': 'assets/example_picture.png'},
      {'date': '2.27-3.12', 'image': 'assets/example2.png'},
      {'date': '3.13-3.27', 'image': 'assets/example_picture.png'},
      {'date': '3.28-4.11', 'image': 'assets/example2.png'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: screenHeight * 0.03),
        child: SizedBox(
          width: screenWidth * 0.523,
          height: screenHeight * 0.057,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            backgroundColor: const Color(0xFF007BEB),
            foregroundColor: const Color(0xFFF8F8F8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21.27),
            ),
            label: Text(
              '홈으로',
              style: TextStyle(
                fontSize: screenWidth * 0.0378,
                fontWeight: FontWeight.w700,
                fontFamily: 'Pretendard',
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Stack(
          children: [
            // Character on top right (behind other content)
            Positioned(
              right: screenWidth * 0.01,
              top: screenHeight * 0.05,
              child: SvgPicture.asset(
                'assets/character_records.svg',
                width: screenWidth * 0.305,
                height: screenHeight * 0.145,
              ),
            ),

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
                  Text(
                    '민준이 건강 기록!',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: screenWidth * 0.0485,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF007BEB),
                      height: 1.4,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Scrollable records list
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: records.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.015),
                          child: _buildRecordCard(
                            context,
                            records[index]['date']!,
                            records[index]['image']!,
                            screenWidth,
                            screenHeight,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordCard(
    BuildContext context,
    String date,
    String imagePath,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.19,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.37),
        ),
      ),
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.37),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                imagePath,
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

          // Dark overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.black.withValues(alpha: 0.65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.37),
              ),
            ),
          ),

          // Date text overlay
          Center(
            child: Text(
              date,
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: screenWidth * 0.0485,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}