import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreviousResultScreen extends StatelessWidget {
  const PreviousResultScreen({super.key});

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
          '이전결과',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  // Main text
                  Text(
                    '현재 민준이의',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF007BEB),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF007BEB),
                      ),
                      children: [
                        const TextSpan(text: '쑥쏙 단계는'),
                        TextSpan(
                          text: ' 2단계',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: '입니다.'),
                      ],
                    ),
                  ),

                  SizedBox(height: 80),

                  // Chart area
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: ChartPainter(),
                    ),
                  ),

                  SizedBox(height: 350),
                ],
              ),
            ),
          ),
          
          // Character positioned at bottom right
          Positioned(
            right: screenWidth * 0.05,
            bottom: screenHeight * 0.001,
            child: SvgPicture.asset(
              'assets/character_at_home.svg',
              width: screenWidth * 0.375,
              height: screenHeight * 0.225,
            ),
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFD724)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final circlePaint = Paint()
      ..color = const Color(0xFFFFD724)
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // Chart line path
    final path = Path();
    path.moveTo(20, size.height * 0.8);
    path.lineTo(size.width * 0.3, size.height * 0.5);
    path.lineTo(size.width * 0.6, size.height * 0.65);
    path.lineTo(size.width * 0.85, size.height * 0.2);

    canvas.drawPath(path, paint);

    // Data points
    final points = [
      {'x': 20.0, 'y': size.height * 0.8, 'value': '1.3', 'size': 11.0},
      {'x': size.width * 0.3, 'y': size.height * 0.5, 'value': '1.6', 'size': 11.0},
      {'x': size.width * 0.6, 'y': size.height * 0.65, 'value': '1.4', 'size': 11.0},
      {'x': size.width * 0.85, 'y': size.height * 0.2, 'value': '2', 'size': 23.0},
    ];

    for (final point in points) {
      // Draw circle
      canvas.drawCircle(
        Offset(point['x'] as double, point['y'] as double),
        (point['size'] as double) / 2,
        circlePaint,
      );

      // Draw text
      textPainter.text = TextSpan(
        text: point['value'] as String,
        style: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: point['value'] == '2' ? 20 : 15,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFFFD724),
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          (point['x'] as double) - textPainter.width / 2,
          (point['y'] as double) + (point['size'] as double) / 2 + 8,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}