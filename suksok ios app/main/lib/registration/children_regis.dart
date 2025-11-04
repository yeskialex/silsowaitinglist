import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'character_creation/1_camera.dart';

class ChildrenRegistrationFlow extends StatefulWidget {
  const ChildrenRegistrationFlow({super.key});

  @override
  State<ChildrenRegistrationFlow> createState() => _ChildrenRegistrationFlowState();
}

class _ChildrenRegistrationFlowState extends State<ChildrenRegistrationFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _numberOfChildren = 0;
  List<Map<String, dynamic>> _childrenData = [];
  int _expandedCardIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  void _nextPage() {
    if (_currentPage == 0 && _numberOfChildren > 0) {
      setState(() {
        _childrenData = List.generate(_numberOfChildren, (index) => {
          'name': '',
          'gender': '',
          'months': '',
        });
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              _currentPage = page;
            });
          },
          children: [
            _buildChildrenNumberPage(),
            if (_numberOfChildren > 0) _buildAllChildrenInfoPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildChildrenNumberPage() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/logo2.svg',
                width: 30,
                height: 30,
              ),
            ],
          ),
          const SizedBox(height: 60),
          RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF1976D2),
                height: 1.3,
                fontFamily: 'Pretendard',
              ),
              children: [
                TextSpan(
                  text: '등록할 ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: '자녀의 수',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: '를\n입력해주세요!',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: _numberOfChildren > 0 ? () {
                      setState(() {
                        _numberOfChildren--;
                      });
                    } : null,
                    icon: Icon(
                      Icons.remove,
                      color: _numberOfChildren > 0 ? const Color(0xFF1976D2) : Colors.grey,
                      size: 40,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1976D2).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '$_numberOfChildren',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1976D2),
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _numberOfChildren++;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xFF1976D2),
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 180),
          Center(
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: _numberOfChildren > 0 ? _nextPage : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  '다음',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildAllChildrenInfoPage() {
    if (_childrenData.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/logo2.svg',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF007BEB),
                        fontFamily: 'Pretendard',
                        letterSpacing: -0.37,
                      ),
                      children: [
                        TextSpan(
                          text: '프로필 설정을 위해\n',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: '우리 아이의 정보',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: '를 입력해주세요!',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ...List.generate(_numberOfChildren, (index) => _buildChildProfileCard(index)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(24.0),
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              width: 194.16,
              height: 42.58,
              child: ElevatedButton(
                onPressed: _canProceedAll() ? _completeRegistration : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007BEB),
                  foregroundColor: const Color(0xFFF8F8F8),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21.27),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  '다음',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Pretendard',
                    height: 0.84,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChildProfileCard(int childIndex) {
    if (childIndex >= _childrenData.length) {
      return const SizedBox.shrink();
    }

    final isExpanded = _expandedCardIndex == childIndex;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF007BEB),
        borderRadius: BorderRadius.circular(8.37),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (_expandedCardIndex == childIndex) {
                  _expandedCardIndex = -1; // Close if already open
                } else {
                  _expandedCardIndex = childIndex; // Open this card and close others
                }
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _childrenData[childIndex]['name'].isEmpty
                      ? '자녀${childIndex + 1} 프로필 설정'
                      : '${_childrenData[childIndex]['name']} 프로필 설정',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 20),
          const Text(
            '이름',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Pretendard',
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _childrenData[childIndex]['name'] = value;
                });
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                hintText: '이름을 입력하세요',
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '성별',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Pretendard',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _childrenData[childIndex]['gender'] = '남';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: _childrenData[childIndex]['gender'] == '남'
                          ? const Color(0xFFFFD700)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '남',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _childrenData[childIndex]['gender'] = '여';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: _childrenData[childIndex]['gender'] == '여'
                          ? const Color(0xFFFFD700)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '여',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '개월수',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Pretendard',
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _childrenData[childIndex]['months'] = value;
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                hintText: '개월수를 입력하세요',
              ),
            ),
          ),
          ],
        ],
      ),
    );
  }

  bool _canProceed(int childIndex) {
    if (childIndex >= _childrenData.length) {
      return false;
    }
    final child = _childrenData[childIndex];
    return child['name'].isNotEmpty &&
           child['gender'].isNotEmpty &&
           child['months'].isNotEmpty;
  }

  bool _canProceedAll() {
    if (_childrenData.isEmpty) return false;
    for (int i = 0; i < _childrenData.length; i++) {
      if (!_canProceed(i)) return false;
    }
    return true;
  }

  void _completeRegistration() {
    // Navigate directly to camera screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );
  }
}