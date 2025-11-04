import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '3_picture.dart';

class CameraReadyScreen extends StatefulWidget {
  const CameraReadyScreen({super.key});

  @override
  State<CameraReadyScreen> createState() => _CameraReadyScreenState();
}

class _CameraReadyScreenState extends State<CameraReadyScreen> {
  bool _isCapturing = false;
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras!.isNotEmpty) {
        // Use back camera if available, otherwise use first camera
        final backCamera = _cameras!.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back,
          orElse: () => _cameras!.first,
        );

        _cameraController = CameraController(
          backCamera,
          ResolutionPreset.high,
          enableAudio: false,
        );

        await _cameraController!.initialize();
        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
        }
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _capturePhoto() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    setState(() {
      _isCapturing = true;
    });

    try {
      final XFile photo = await _cameraController!.takePicture();

      if (mounted) {
        setState(() {
          _isCapturing = false;
        });

        // Navigate to picture screen with the captured image
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => PictureScreen(imagePath: photo.path),
          ),
        );
      }
    } catch (e) {
      print('Error capturing photo: $e');
      setState(() {
        _isCapturing = false;
      });
    }
  }

  void _cancelCamera() {
    Navigator.of(context).pop();
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

          // Camera preview or placeholder
          Positioned(
            top: 140, // Just below the logo area
            left: 0,
            right: 0,
            bottom: 170, // Above the capture button area
            child: _isCameraInitialized && _cameraController != null
                ? ClipRect(
                    child: Transform.scale(
                      scale: _cameraController!.value.aspectRatio / (screenWidth / (screenHeight - 310)),
                      child: Center(
                        child: CameraPreview(_cameraController!),
                      ),
                    ),
                  )
                : Container(
                    color: const Color(0xFFE4EEF7),
                    child: Center(
                      child: _cameras == null
                          ? CircularProgressIndicator(
                              color: const Color(0xFF007BEB),
                            )
                          : Text(
                              '정면으로 얼굴이\n나오게 촬영해주세요!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF007BEB),
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                            ),
                    ),
                  ),
          ),

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
                    // Cancel button
                    GestureDetector(
                      onTap: _cancelCamera,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Text(
                          '취소',
                          style: TextStyle(
                            color: const Color(0xFF007BEB),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // Capture button
                    GestureDetector(
                      onTap: _isCapturing ? null : _capturePhoto,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF007BEB),
                            width: 8,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _isCapturing
                                ? Colors.grey
                                : const Color(0xFF007BEB),
                          ),
                          child: _isCapturing
                              ? const Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),

                    // Empty space for balance
                    const SizedBox(width: 60),
                  ],
                ),
              ),
            ),
          ),

          // Flash/overlay effect when capturing
          if (_isCapturing)
            Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.white.withValues(alpha: 0.8),
            ),
        ],
      ),
    );
  }
}