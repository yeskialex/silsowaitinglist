import 'package:flutter/material.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

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
          '떼 지속시간',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF007BEB),
            letterSpacing: -0.72,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.035),

              // Log entry cards
              _buildLogEntry(
                context,
                screenWidth,
                screenHeight,
                date: '10.31.금',
                tantrumTime: '2:39',
                calmTime: '0:54',
                educationTime: '3:02',
                changeText: '떼쓰기 시간 5% 감소!',
                description: '아이의 이해도가 올라가고 있어요.',
                tantrumProgress: 0.29,
                calmProgress: 0.25,
                educationProgress: 0.58,
              ),

              SizedBox(height: screenHeight * 0.04),

              _buildLogEntry(
                context,
                screenWidth,
                screenHeight,
                date: '10.29.수',
                tantrumTime: '4:28',
                calmTime: '1:45',
                educationTime: '2:33',
                changeText: '떼쓰기 시간 2% 증가!',
                description: '아이가 조금 혼란스러웠어요.',
                tantrumProgress: 0.4,
                calmProgress: 0.47,
                educationProgress: 0.58,
              ),

              SizedBox(height: screenHeight * 0.04),

              _buildLogEntry(
                context,
                screenWidth,
                screenHeight,
                date: '10.26.일',
                tantrumTime: '2:39',
                calmTime: '0:54',
                educationTime: '3:02',
                changeText: '떼쓰기 시간 4% 감소!',
                description: '아이의 이해도가 올라가고 있어요.',
                tantrumProgress: 0.29,
                calmProgress: 0.25,
                educationProgress: 0.58,
              ),

              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogEntry(
    BuildContext context,
    double screenWidth,
    double screenHeight, {
    required String date,
    required String tantrumTime,
    required String calmTime,
    required String educationTime,
    required String changeText,
    required String description,
    required double tantrumProgress,
    required double calmProgress,
    required double educationProgress,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date outside the card
        Text(
          date,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF007BEB),
          ),
        ),

        SizedBox(height: screenHeight * 0.01),

        // Card without date
        _buildLogCard(
          context,
          screenWidth,
          screenHeight,
          tantrumTime: tantrumTime,
          calmTime: calmTime,
          educationTime: educationTime,
          changeText: changeText,
          description: description,
          tantrumProgress: tantrumProgress,
          calmProgress: calmProgress,
          educationProgress: educationProgress,
        ),
      ],
    );
  }

  Widget _buildLogCard(
    BuildContext context,
    double screenWidth,
    double screenHeight, {
    required String tantrumTime,
    required String calmTime,
    required String educationTime,
    required String changeText,
    required String description,
    required double tantrumProgress,
    required double calmProgress,
    required double educationProgress,
  }) {
    return Container(
      width: screenWidth * 0.85,
      height: screenHeight * 0.18,
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
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.015),

          // Progress bar and labels
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                // Time values (top)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tantrumTime,
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF007BEB),
                      ),
                    ),
                    Text(
                      calmTime,
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF007BEB),
                      ),
                    ),
                    Text(
                      educationTime,
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF007BEB),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.008),

                // Progress bar
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Background bar
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.01,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE4E1E1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.37),
                        ),
                      ),
                    ),

                    // Tantrum section (light blue)
                    Container(
                      width: (screenWidth * 0.75) * (tantrumProgress / (tantrumProgress + calmProgress + educationProgress)),
                      height: screenHeight * 0.01,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFC9E5FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.37),
                        ),
                      ),
                    ),

                    // Calm section (medium blue)
                    Positioned(
                      left: (screenWidth * 0.75) * (tantrumProgress / (tantrumProgress + calmProgress + educationProgress)),
                      child: Container(
                        width: (screenWidth * 0.75) * (calmProgress / (tantrumProgress + calmProgress + educationProgress)),
                        height: screenHeight * 0.01,
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
                      left: (screenWidth * 0.75) * ((tantrumProgress + calmProgress) / (tantrumProgress + calmProgress + educationProgress)),
                      child: Container(
                        width: (screenWidth * 0.75) * (educationProgress / (tantrumProgress + calmProgress + educationProgress)),
                        height: screenHeight * 0.01,
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
                      left: ((screenWidth * 0.75) * (tantrumProgress / (tantrumProgress + calmProgress + educationProgress))) - screenWidth * 0.015,
                      top: -screenHeight * 0.002,
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
                      left: ((screenWidth * 0.75) * ((tantrumProgress + calmProgress) / (tantrumProgress + calmProgress + educationProgress))) - screenWidth * 0.015,
                      top: -screenHeight * 0.002,
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
                      left: (screenWidth * 0.75) - screenWidth * 0.015,
                      top: -screenHeight * 0.002,
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

                SizedBox(height: screenHeight * 0.008),

                // Category labels (bottom)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '떼쓰기',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF007BEB),
                      ),
                    ),
                    Text(
                      '진정',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF007BEB),
                      ),
                    ),
                    Text(
                      '교육',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF007BEB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.03),

          // Analysis text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF007BEB),
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(text: '$changeText\n'),
                    TextSpan(text: description),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}