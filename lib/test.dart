import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GuardSelectionScreen extends StatefulWidget {
  const GuardSelectionScreen({Key? key}) : super(key: key);

  @override
  State<GuardSelectionScreen> createState() => _GuardSelectionScreenState();
}

class _GuardSelectionScreenState extends State<GuardSelectionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Guard> guardTypes = [
    Guard(
      name: 'الحارس التكتيكي',
      description: 'مدرب على التعامل مع المواقف عالية الخطورة',
      lottieAsset: 'assets/animations/tactical_guard.json',
      hourlyRate: 50.0,
    ),
    Guard(
      name: 'حارس تنفيذي',
      description: 'متخصص في حماية الشخصيات الهامة',
      lottieAsset: 'assets/animations/executive_guard.json',
      hourlyRate: 40.0,
    ),
    Guard(
      name: 'حارس الفعاليات',
      description: 'خبير في تأمين الفعاليات والمناسبات',
      lottieAsset: 'assets/animations/Animation - 1741306603791.json',
      hourlyRate: 35.0,
    ),
  ];

  void _nextPage() {
    if (_currentPage < guardTypes.length - 1) {
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

  void _selectGuard() {
    // Navigate to details screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                GuardDetailsScreen(selectedGuard: guardTypes[_currentPage]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full screen PageView
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: guardTypes.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Background color
                  Container(color: Colors.black),
                  // Lottie Animation
                  Center(
                    child: Lottie.asset(
                      guardTypes[index].lottieAsset,
                      height: MediaQuery.of(context).size.height * 0.5,
                      fit: BoxFit.contain,
                      repeat: true,
                    ),
                  ),
                  // Gradient overlay for better text visibility
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Content
                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 48,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'اختر نوع الحارس',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          guardTypes[index].description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.white70),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${guardTypes[index].hourlyRate.toStringAsFixed(2)} \$ / ساعة',
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20),
                                  ),
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                  ),
                                  onPressed:
                                      _currentPage > 0 ? _previousPage : null,
                                ),
                              ),
                              Text(
                                guardTypes[index].name,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20),
                                  ),
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                  ),
                                  onPressed:
                                      _currentPage < guardTypes.length - 1
                                          ? _nextPage
                                          : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white30),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            onPressed: _selectGuard,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('اختيار'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          // Back Button
          Positioned(
            top: 48,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Guard {
  final String name;
  final String description;
  final String lottieAsset;
  final double hourlyRate;

  Guard({
    required this.name,
    required this.description,
    required this.lottieAsset,
    required this.hourlyRate,
  });
}

class GuardDetailsScreen extends StatelessWidget {
  final Guard selectedGuard;

  const GuardDetailsScreen({Key? key, required this.selectedGuard})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement your details screen here
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedGuard.name),
        backgroundColor: Colors.black,
      ),
      body: Center(child: Text('تفاصيل الحارس')),
    );
  }
}
