import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import '4_loading.dart';

class PictureScreen extends StatefulWidget {
  final String? imagePath;
  const PictureScreen({super.key, this.imagePath});

  @override
  State<PictureScreen> createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  void _retakePhoto() {
    Navigator.of(context).pop(); // Go back to camera screen
  }

  void _usePhoto() {
    // Navigate to loading screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoadingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Camera viewfinder background
          Container(
            width: screenWidth,
            height: screenHeight,
            color: Colors.white,
          ),

          // Status bar with logo
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/logo2.svg',
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),
          ),

          // Picture display area
          Positioned(
            top: 140, // Just below the logo area
            left: 0,
            right: 0,
            bottom: 170, // Above the button area
            child: Image.asset(
              'assets/example_picture.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Center instruction text (removed since we're showing the photo)

          // Bottom controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Retake button
                    GestureDetector(
                      onTap: _retakePhoto,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Text(
                          '다시찍기',
                          style: TextStyle(
                            color: const Color(0xFF007BEB),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // Use photo button
                    GestureDetector(
                      onTap: _usePhoto,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Text(
                          '사진사용',
                          style: TextStyle(
                            color: const Color(0xFF007BEB),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
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