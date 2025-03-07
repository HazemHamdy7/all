// import 'package:all/constants/assets.dart';
// import 'package:all/screens/home/service_view/widget/dress_details_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class DressCode {
//   final String name;
//   final String image;
//   final String description;

//   DressCode({
//     required this.name,
//     required this.image,
//     required this.description,
//   });
// }

// class DressCodeScreen extends StatefulWidget {
//   const DressCodeScreen({super.key});

//   @override
//   State<DressCodeScreen> createState() => _DressCodeScreenState();
// }

// class _DressCodeScreenState extends State<DressCodeScreen>
//     with SingleTickerProviderStateMixin {
//   final _pageController = PageController();
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _translateAnimation;
//   int _currentPage = 0;
//   bool _isAnimating = false;

//   final List<DressCode> dressCodeOptions = [
//     DressCode(
//       name: 'Tactical Casual',
//       image: Assets.imageBoudGuard1,
//       description: 'Protectors tailor their uniform for any occasion.',
//     ),
//     DressCode(
//       name: 'Business Casual',
//       image: Assets.imageBodyGurd4,
//       description: 'Protectors tailor their uniform for any occasion.',
//     ),
//     DressCode(
//       name: 'Formal',
//       image: Assets.imageBodyGurd6,
//       description: 'Protectors tailor their uniform for any occasion.',
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();

//     // Initialize animation controller
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200), // Slower animation duration
//     );

//     // Create scale animation
//     _scaleAnimation = Tween<double>(begin: 1.02, end: 1.05).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );

//     // Create translate animation for subtle movement
//     _translateAnimation = Tween<double>(begin: 0, end: 10).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );

//     // Start the breathing animation
//     _animationController.repeat(reverse: true);

//     // Add listener to page controller for custom animations
//     _pageController.addListener(() {
//       // Detect page changes for animation triggers
//       if (_pageController.page?.round() != _currentPage && !_isAnimating) {
//         setState(() {
//           _isAnimating = true;
//         });

//         // Reset animation state after transition completes
//         Future.delayed(const Duration(milliseconds: 800), () {
//           if (mounted) {
//             setState(() {
//               _isAnimating = false;
//             });
//           }
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _nextPage() {
//     if (_currentPage < dressCodeOptions.length - 1) {
//       // Add haptic feedback for better user experience
//       HapticFeedback.lightImpact();

//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 800), // Slower page transition
//         curve: Curves.easeOutCubic,
//       );
//     }
//   }

//   void _previousPage() {
//     if (_currentPage > 0) {
//       // Add haptic feedback for better user experience
//       HapticFeedback.lightImpact();

//       _pageController.previousPage(
//         duration: const Duration(milliseconds: 800),
//         curve: Curves.easeOutCubic,
//       );
//     }
//   }

//   void _chooseDressCode() {
//     HapticFeedback.mediumImpact();

//     // Show a SnackBar with the selected dress code
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         animation: AlwaysStoppedAnimation(BorderSide.strokeAlignCenter),
//         elevation: 10,
//         behavior: SnackBarBehavior.floating, // Slower SnackBar animation
//         backgroundColor: Colors.green[400],
//         content: RichText(
//           text: TextSpan(
//             children: [
//               const TextSpan(
//                 text: 'Dress code selected: ',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//               TextSpan(
//                 text: dressCodeOptions[_currentPage].name,
//                 style: TextStyle(color: Colors.white, fontSize: 14),
//               ),
//             ],
//           ),
//         ),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Full screen PageView with custom page transition
//           PageView.builder(
//             controller: _pageController,
//             onPageChanged: (int page) {
//               setState(() {
//                 _currentPage = page;
//               });
//             },
//             itemCount: dressCodeOptions.length,
//             itemBuilder: (context, index) {
//               // Calculate if this is the active page
//               bool isCurrentPage = index == _currentPage;

//               return Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   // Animated Background Image
//                   AnimatedBuilder(
//                     animation: _animationController,
//                     builder: (context, child) {
//                       return Transform.scale(
//                         scale: isCurrentPage ? _scaleAnimation.value : 1.0,
//                         child: Transform.translate(
//                           offset:
//                               isCurrentPage
//                                   ? Offset(0, _translateAnimation.value)
//                                   : const Offset(0, 0),
//                           child: Hero(
//                             tag: 'dress_image_${dressCodeOptions[index].name}',
//                             child: Image.asset(
//                               dressCodeOptions[index].image,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                               height: double.infinity,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),

//                   // Gradient overlay with animated opacity
//                   AnimatedOpacity(
//                     opacity: _isAnimating ? 0.9 : 0.7,
//                     duration: const Duration(
//                       milliseconds: 800,
//                     ), // Slower opacity transition
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withOpacity(0.7),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   // Content with animations
//                   Positioned(
//                     left: 24,
//                     right: 24,
//                     bottom: 48,
//                     child: AnimatedOpacity(
//                       opacity: isCurrentPage ? 1.0 : 0.0,
//                       duration: const Duration(
//                         milliseconds: 600,
//                       ), // Slower opacity transition
//                       child: AnimatedPadding(
//                         padding: EdgeInsets.only(
//                           bottom: isCurrentPage ? 0 : 20,
//                         ),
//                         duration: const Duration(
//                           milliseconds: 600,
//                         ), // Slower padding transition
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             // Title with animation
//                             TweenAnimationBuilder<double>(
//                               tween: Tween<double>(begin: 0.0, end: 1.0),
//                               duration: const Duration(
//                                 milliseconds: 800,
//                               ), // Slower title animation
//                               builder: (context, value, child) {
//                                 return Opacity(
//                                   opacity: value,
//                                   child: Transform.translate(
//                                     offset: Offset(0, 20 * (1 - value)),
//                                     child: child,
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 'Pick Dress Code',
//                                 style: Theme.of(context).textTheme.headlineSmall
//                                     ?.copyWith(color: Colors.white),
//                               ),
//                             ),

//                             const SizedBox(height: 8),

//                             // Description with animation
//                             TweenAnimationBuilder<double>(
//                               tween: Tween<double>(begin: 0.0, end: 1.0),
//                               duration: const Duration(
//                                 milliseconds: 800,
//                               ), // Slower description animation
//                               curve: Curves.easeOut,
//                               builder: (context, value, child) {
//                                 return Opacity(
//                                   opacity: value,
//                                   child: Transform.translate(
//                                     offset: Offset(0, 20 * (1 - value)),
//                                     child: child,
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 dressCodeOptions[index].description,
//                                 style: Theme.of(context).textTheme.bodyMedium
//                                     ?.copyWith(color: Colors.white70),
//                               ),
//                             ),

//                             const SizedBox(height: 24),

//                             // Navigation controls with animation
//                             TweenAnimationBuilder<double>(
//                               tween: Tween<double>(begin: 0.0, end: 1.0),
//                               duration: const Duration(
//                                 milliseconds: 800,
//                               ), // Slower navigation controls animation
//                               curve: Curves.easeOut,
//                               builder: (context, value, child) {
//                                 return Opacity(
//                                   opacity: value,
//                                   child: Transform.translate(
//                                     offset: Offset(0, 20 * (1 - value)),
//                                     child: child,
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                   vertical: 6,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.black.withOpacity(0.1),
//                                   borderRadius: BorderRadius.circular(30),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black26.withOpacity(0.2),
//                                       blurRadius: 10,
//                                       offset: const Offset(0, 5),
//                                     ),
//                                   ],
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     // Previous button with animation
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             const BorderRadius.horizontal(
//                                               left: Radius.circular(20),
//                                               right: Radius.circular(20),
//                                             ),
//                                         color: Colors.black.withOpacity(0.6),
//                                       ),
//                                       child: IconButton(
//                                         icon: const Icon(
//                                           Icons.chevron_left,
//                                           color: Colors.white,
//                                         ),
//                                         onPressed:
//                                             _currentPage > 0
//                                                 ? _previousPage
//                                                 : null,
//                                       ),
//                                     ),

//                                     // Dress code name with animation
//                                     AnimatedSwitcher(
//                                       duration: const Duration(
//                                         milliseconds:
//                                             600, // Slower switcher animation
//                                       ),
//                                       transitionBuilder: (
//                                         Widget child,
//                                         Animation<double> animation,
//                                       ) {
//                                         return FadeTransition(
//                                           opacity: animation,
//                                           child: SlideTransition(
//                                             position: Tween<Offset>(
//                                               begin: const Offset(0.0, 0.5),
//                                               end: Offset.zero,
//                                             ).animate(animation),
//                                             child: child,
//                                           ),
//                                         );
//                                       },
//                                       child: Text(
//                                         dressCodeOptions[index].name,
//                                         key: ValueKey<String>(
//                                           dressCodeOptions[index].name,
//                                         ),
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleMedium
//                                             ?.copyWith(color: Colors.white),
//                                       ),
//                                     ),

//                                     // Next button with animation
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             const BorderRadius.horizontal(
//                                               left: Radius.circular(20),
//                                               right: Radius.circular(20),
//                                             ),
//                                         color: Colors.black.withOpacity(0.6),
//                                       ),
//                                       child: IconButton(
//                                         icon: const Icon(
//                                           Icons.chevron_right,
//                                           color: Colors.white,
//                                         ),
//                                         onPressed:
//                                             _currentPage <
//                                                     dressCodeOptions.length - 1
//                                                 ? _nextPage
//                                                 : null,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),

//                             const SizedBox(height: 24),

//                             // Choose button with animation
//                             TweenAnimationBuilder<double>(
//                               tween: Tween<double>(begin: 0.0, end: 1.0),
//                               duration: const Duration(
//                                 milliseconds: 800,
//                               ), // Slower choose button animation
//                               curve: Curves.easeOut,
//                               builder: (context, value, child) {
//                                 return Opacity(
//                                   opacity: value,
//                                   child: Transform.translate(
//                                     offset: Offset(0, 20 * (1 - value)),
//                                     child: child,
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.white30),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: _chooseDressCode,
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white,
//                                     foregroundColor: Colors.black,
//                                     padding: const EdgeInsets.symmetric(
//                                       vertical: 16,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                     ),
//                                   ),
//                                   child: const Text('Choose'),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),

//           // Back Button with animation
//           Positioned(
//             top: 48,
//             left: 16,
//             child: TweenAnimationBuilder<double>(
//               tween: Tween<double>(begin: 0.0, end: 1.0),
//               duration: const Duration(
//                 milliseconds: 800,
//               ), // Slower back button animation
//               builder: (context, value, child) {
//                 return Opacity(
//                   opacity: value,
//                   child: Transform.translate(
//                     offset: Offset(-20 * (1 - value), 0),
//                     child: child,
//                   ),
//                 );
//               },
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () {
//                   Navigator.maybePop(context);
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:all/cubits/dress_cubit/dress_code_cubit.dart';
import 'package:all/cubits/dress_cubit/dress_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:all/constants/assets.dart';

import 'dress_details_page.dart';

class DressCodeScreen extends StatefulWidget {
  const DressCodeScreen({super.key});

  @override
  State<DressCodeScreen> createState() => _DressCodeScreenState();
}

class _DressCodeScreenState extends State<DressCodeScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _translateAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = Tween<double>(begin: 1.02, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _translateAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.repeat(reverse: true);

    // Listen for page changes to trigger animations and update the cubit.
    _pageController.addListener(() {
      final currentPage = _pageController.page?.round() ?? 0;
      if (currentPage != context.read<DressCodeCubit>().state.currentIndex &&
          !_isAnimating) {
        context.read<DressCodeCubit>().updatePage(currentPage);
        setState(() {
          _isAnimating = true;
        });
        Future.delayed(const Duration(milliseconds: 800), () {
          if (mounted) {
            setState(() {
              _isAnimating = false;
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _nextPage(BuildContext context, DressCodeState state) {
    if (state.currentIndex < state.options.length - 1) {
      HapticFeedback.lightImpact();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _previousPage(BuildContext context, DressCodeState state) {
    if (state.currentIndex > 0) {
      HapticFeedback.lightImpact();
      _pageController.previousPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _chooseDressCode(DressCodeState state) {
    HapticFeedback.mediumImpact();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                DressDetailsPage(dressCode: state.options[state.currentIndex]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DressCodeCubit, DressCodeState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  context.read<DressCodeCubit>().updatePage(page);
                },
                itemCount: state.options.length,
                itemBuilder: (context, index) {
                  bool isCurrentPage = index == state.currentIndex;
                  final option = state.options[index];

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: isCurrentPage ? _scaleAnimation.value : 1.0,
                            child: Transform.translate(
                              offset:
                                  isCurrentPage
                                      ? Offset(0, _translateAnimation.value)
                                      : Offset.zero,
                              child: Hero(
                                tag: 'dress_image_${option.name}',
                                child: Image.asset(
                                  option.image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      AnimatedOpacity(
                        opacity: _isAnimating ? 0.9 : 0.7,
                        duration: const Duration(milliseconds: 800),
                        child: Container(
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
                      ),
                      Positioned(
                        left: 24,
                        right: 24,
                        bottom: 48,
                        child: AnimatedOpacity(
                          opacity: isCurrentPage ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          child: AnimatedPadding(
                            padding: EdgeInsets.only(
                              bottom: isCurrentPage ? 0 : 20,
                            ),
                            duration: const Duration(milliseconds: 600),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0.0, end: 1.0),
                                  duration: const Duration(milliseconds: 800),
                                  builder: (context, value, child) {
                                    return Opacity(
                                      opacity: value,
                                      child: Transform.translate(
                                        offset: Offset(0, 20 * (1 - value)),
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Pick Dress Code',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0.0, end: 1.0),
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeOut,
                                  builder: (context, value, child) {
                                    return Opacity(
                                      opacity: value,
                                      child: Transform.translate(
                                        offset: Offset(0, 20 * (1 - value)),
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    option.description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white70),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0.0, end: 1.0),
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeOut,
                                  builder: (context, value, child) {
                                    return Opacity(
                                      opacity: value,
                                      child: Transform.translate(
                                        offset: Offset(0, 20 * (1 - value)),
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26.withOpacity(
                                            0.2,
                                          ),
                                          blurRadius: 10,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.horizontal(
                                                  left: Radius.circular(20),
                                                  right: Radius.circular(20),
                                                ),
                                            color: Colors.black.withOpacity(
                                              0.6,
                                            ),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.chevron_left,
                                              color: Colors.white,
                                            ),
                                            onPressed:
                                                state.currentIndex > 0
                                                    ? () => _previousPage(
                                                      context,
                                                      state,
                                                    )
                                                    : null,
                                          ),
                                        ),
                                        AnimatedSwitcher(
                                          duration: const Duration(
                                            milliseconds: 600,
                                          ),
                                          transitionBuilder: (
                                            child,
                                            animation,
                                          ) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: const Offset(0.0, 0.5),
                                                  end: Offset.zero,
                                                ).animate(animation),
                                                child: child,
                                              ),
                                            );
                                          },
                                          child: Text(
                                            option.name,
                                            key: ValueKey<String>(option.name),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.horizontal(
                                                  left: Radius.circular(20),
                                                  right: Radius.circular(20),
                                                ),
                                            color: Colors.black.withOpacity(
                                              0.6,
                                            ),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.chevron_right,
                                              color: Colors.white,
                                            ),
                                            onPressed:
                                                state.currentIndex <
                                                        state.options.length - 1
                                                    ? () => _nextPage(
                                                      context,
                                                      state,
                                                    )
                                                    : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0.0, end: 1.0),
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeOut,
                                  builder: (context, value, child) {
                                    return Opacity(
                                      opacity: value,
                                      child: Transform.translate(
                                        offset: Offset(0, 20 * (1 - value)),
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white30),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () => _chooseDressCode(state),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                      ),
                                      child: const Text('Choose'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                top: 48,
                left: 16,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(-20 * (1 - value), 0),
                        child: child,
                      ),
                    );
                  },
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.maybePop(context),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
