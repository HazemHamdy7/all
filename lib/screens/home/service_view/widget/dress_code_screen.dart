// import 'package:all/constants/assets.dart';
// import 'package:all/model/dress_code.dart';
// import 'package:all/screens/home/services/vehicle_selection_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:all/model/dress_code.dart';
import 'package:all/test.dart';
import 'package:flutter/material.dart';

class DressCodeScreen extends StatefulWidget {
  const DressCodeScreen({super.key});

  @override
  State<DressCodeScreen> createState() => _DressCodeScreenState();
}

class _DressCodeScreenState extends State<DressCodeScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  final List<DressCode> dressCodeOptions = [
    DressCode(
      name: 'Tactical Casual',
      image: 'assets/image/white_car.png',
      description: 'Protectors tailor their uniform for any occasion.',
    ),
    DressCode(
      name: 'Business Casual',
      image: 'assets/image/man1.jpg',
      description: 'Protectors tailor their uniform for any occasion.',
    ),
    DressCode(
      name: 'Formal',
      image: 'assets/image/onboarding.png',
      description: 'Protectors tailor their uniform for any occasion.',
    ),
  ];

  void _nextPage() {
    if (_currentPage < dressCodeOptions.length - 1) {
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
            itemCount: dressCodeOptions.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image
                  Image.asset(dressCodeOptions[index].image, fit: BoxFit.cover),
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
                          'Pick Dress Code',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          dressCodeOptions[index].description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.white70),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
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
                                dressCodeOptions[index].name,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
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
                                      _currentPage < dressCodeOptions.length - 1
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
                            onPressed: _nextPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('Next'),
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

class DressCodeOption {
  final String name;
  final String description;
  final String image;

  DressCodeOption({
    required this.name,
    required this.description,
    required this.image,
  });
}
