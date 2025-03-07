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

// class _DressCodeScreenState extends State<DressCodeScreen> with TickerProviderStateMixin {
//   final _pageController = PageController();
//   late AnimationController _breathingController;
//   late AnimationController _walkingController;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _horizontalMoveAnimation;
//   late Animation<double> _verticalMoveAnimation;
//   int _currentPage = 0;
//   bool _isAnimating = false;

//   final List<DressCode> dressCodeOptions = [
//     DressCode(
//       name: 'Tactical Casual',
//       image: 'assets/image/bodyguard1.jpg',
//       description: 'Protectors tailor their uniform for any occasion.',
//     ),
//     DressCode(
//       name: 'Business Casual',
//       image: 'assets/image/bodyguard2.jpg',
//       description: 'Protectors tailor their uniform for any occasion.',
//     ),
//     DressCode(
//       name: 'Formal',
//       image: 'assets/image/bodyguard3.jpg',
//       description: 'Protectors tailor their uniform for any occasion.',
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
    
//     // Initialize breathing animation controller
//     _breathingController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2000),
//     );
    
//     // Initialize walking animation controller
//     _walkingController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 6000),
//     );
    
//     // Create scale animation for breathing effect
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
//       CurvedAnimation(
//         parent: _breathingController,
//         curve: Curves.easeInOut,
//       ),
//     );
    
//     // Create horizontal movement animation (left to right)
//     _horizontalMoveAnimation = TweenSequence<double>([
//       TweenSequenceItem(
//         tween: Tween<double>(begin: -8.0, end: 8.0)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//         weight: 50,
//       ),
//       TweenSequenceItem(
//         tween: Tween<double>(begin: 8.0, end: -8.0)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//         weight: 50,
//       ),
//     ]).animate(_walkingController);
    
//     // Create vertical movement animation (slight up and down for walking)
//     _verticalMoveAnimation = TweenSequence<double>([
//       TweenSequenceItem(
//         tween: Tween<double>(begin: 0.0, end: -3.0)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//         weight: 25,
//       ),
//       TweenSequenceItem(
//         tween: Tween<double>(begin: -3.0, end: 0.0)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//         weight: 25,
//       ),
//       TweenSequenceItem(
//         tween: Tween<double>(begin: 0.0, end: -3.0)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//         weight: 25,
//       ),
//       TweenSequenceItem(
//         tween: Tween<double>(begin: -3.0, end: 0.0)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//         weight: 25,
//       ),
//     ]).animate(_walkingController);
    
//     // Start the animations
//     _breathingController.repeat(reverse: true);
//     _walkingController.repeat();
    
//     // Add listener to page controller for custom animations
//     _pageController.addListener(() {
//       // Detect page changes for animation triggers
//       if (_pageController.page?.round() != _currentPage && !_isAnimating) {
//         setState(() {
//           _isAnimating = true;
//         });
        
//         // Reset animation state after transition completes
//         Future.delayed(const Duration(milliseconds: 500), () {
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
//     _breathingController.dispose();
//     _walkingController.dispose();
//     super.dispose();
//   }

//   void _nextPage() {
//     if (_currentPage < dressCodeOptions.length - 1) {
//       // Add haptic feedback for better user experience
//       HapticFeedback.lightImpact();
      
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 600),
//         curve: Curves.easeOutCubic,
//       );
//     }
//   }

//   void _previousPage() {
//     if (_currentPage > 0) {
//       // Add haptic feedback for better user experience
//       HapticFeedback.lightImpact();
      
//       _pageController.previousPage(
//         duration: const Duration(milliseconds: 600),
//         curve: Curves.easeOutCubic,
//       );
//     }
//   }

//   void _chooseDressCode() {
//     // Add haptic feedback for selection
//     HapticFeedback.mediumImpact();
    
//     // Navigate to the dress details screen with the selected dress code
//     Navigator.push(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) => DressDetailsScreen(
//           selectedDressCode: dressCodeOptions[_currentPage],
//         ),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           var begin = const Offset(0.0, 1.0);
//           var end = Offset.zero;
//           var curve = Curves.easeOutCubic;
          
//           var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//           var offsetAnimation = animation.drive(tween);
          
//           return SlideTransition(position: offsetAnimation, child: child);
//         },
//         transitionDuration: const Duration(milliseconds: 500),
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
//                   // Animated Background Image with realistic human movement
//                   AnimatedBuilder(
//                     animation: Listenable.merge([_breathingController, _walkingController]),
//                     builder: (context, child) {
//                       return Transform.scale(
//                         scale: isCurrentPage ? _scaleAnimation.value : 1.0,
//                         child: Transform.translate(
//                           offset: isCurrentPage 
//                               ? Offset(_horizontalMoveAnimation.value, _verticalMoveAnimation.value) 
//                               : const Offset(0, 0),
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
//                     duration: const Duration(milliseconds: 500),
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
//                       duration: const Duration(milliseconds: 300),
//                       child: AnimatedPadding(
//                         padding: EdgeInsets.only(
//                           bottom: isCurrentPage ? 0 : 20,
//                         ),
//                         duration: const Duration(milliseconds: 300),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             // Title with animation
//                             TweenAnimationBuilder<double>(
//                               tween: Tween<double>(begin: 0.0, end: 1.0),
//                               duration: const Duration(milliseconds: 500),
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
//                               duration: const Duration(milliseconds: 500),
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
//                               duration: const Duration(milliseconds: 500),
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
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     // Previous button with animation
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.horizontal(
//                                           left: Radius.circular(20),
//                                           right: Radius.circular(20),
//                                         ),
//                                         color: Colors.black.withOpacity(0.6),
//                                       ),
//                                       child: IconButton(
//                                         icon: const Icon(
//                                           Icons.chevron_left,
//                                           color: Colors.white,
//                                         ),
//                                         onPressed: _currentPage > 0 ? _previousPage : null,
//                                       ),
//                                     ),
                                    
//                                     // Dress code name with animation
//                                     AnimatedSwitcher(
//                                       duration: const Duration(milliseconds: 300),
//                                       transitionBuilder: (Widget child, Animation<double> animation) {
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
//                                         key: ValueKey<String>(dressCodeOptions[index].name),
//                                         style: Theme.of(context).textTheme.titleMedium
//                                             ?.copyWith(color: Colors.white),
//                                       ),
//                                     ),
                                    
//                                     // Next button with animation
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.horizontal(
//                                           left: Radius.circular(20),
//                                           right: Radius.circular(20),
//                                         ),
//                                         color: Colors.black.withOpacity(0.6),
//                                       ),
//                                       child: IconButton(
//                                         icon: const Icon(
//                                           Icons.chevron_right,
//                                           color: Colors.white,
//                                         ),
//                                         onPressed: _currentPage < dressCodeOptions.length - 1
//                                             ? _nextPage
//                                             : null,
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
//                               duration: const Duration(milliseconds: 500),
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
//                                     padding: const EdgeInsets.symmetric(vertical: 16),
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
//               duration: const Duration(milliseconds: 500),
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

// class DressDetailsScreen extends StatefulWidget {
//   final DressCode selectedDressCode;

//   const DressDetailsScreen({
//     Key? key,
//     required this.selectedDressCode,
//   }) : super(key: key);

//   @override
//   State<DressDetailsScreen> createState() => _DressDetailsScreenState();
// }

// class _DressDetailsScreenState extends State<DressDetailsScreen> with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//   late AnimationController _animationController;
  
//   // Form controllers
//   final _nameController = TextEditingController();
//   final _sizeController = TextEditingController();
//   final _colorController = TextEditingController();
//   final _notesController = TextEditingController();
  
//   String _selectedSize = 'M'; // Default size
  
//   final List<String> _availableSizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

//   @override
//   void initState() {
//     super.initState();
    
//     // Initialize animation controller
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1500),
//     );
    
//     // Start the animation
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _sizeController.dispose();
//     _colorController.dispose();
//     _notesController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // Process the form data
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Dress details submitted for ${widget.selectedDressCode.name}'),
//           backgroundColor: Colors.green,
//         ),
//       );
      
//       // Navigate back to the first screen or to a confirmation screen
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dress Details - ${widget.selectedDressCode.name}'),
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Dress code info card with animation
//               SlideTransition(
//                 position: Tween<Offset>(
//                   begin: const Offset(0, 0.5),
//                   end: Offset.zero,
//                 ).animate(CurvedAnimation(
//                   parent: _animationController,
//                   curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
//                 )),
//                 child: FadeTransition(
//                   opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
//                     CurvedAnimation(
//                       parent: _animationController,
//                       curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
//                     ),
//                   ),
//                   child: Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Dress image with Hero animation
//                         ClipRRect(
//                           borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                           child: Hero(
//                             tag: 'dress_image_${widget.selectedDressCode.name}',
//                             child: Image.asset(
//                               widget.selectedDressCode.image,
//                               height: 200,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 widget.selectedDressCode.name,
//                                 style: const TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 widget.selectedDressCode.description,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.grey[600],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
              
//               const SizedBox(height: 24),
              
//               // Dress details form with animation
//               SlideTransition(
//                 position: Tween<Offset>(
//                   begin: const Offset(0, 0.5),
//                   end: Offset.zero,
//                 ).animate(CurvedAnimation(
//                   parent: _animationController,
//                   curve: const Interval(0.3, 0.8, curve: Curves.easeOutCubic),
//                 )),
//                 child: FadeTransition(
//                   opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
//                     CurvedAnimation(
//                       parent: _animationController,
//                       curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
//                     ),
//                   ),
//                   child: Form(
//                     key: _formKey,
//                     child: Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Enter Dress Details',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 16),
                            
//                             // Name field
//                             TextFormField(
//                               controller: _nameController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Your Name',
//                                 border: OutlineInputBorder(),
//                                 prefixIcon: Icon(Icons.person),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your name';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 16),
                            
//                             // Size dropdown
//                             DropdownButtonFormField<String>(
//                               value: _selectedSize,
//                               decoration: const InputDecoration(
//                                 labelText: 'Size',
//                                 border: OutlineInputBorder(),
//                                 prefixIcon: Icon(Icons.straighten),
//                               ),
//                               items: _availableSizes.map((String size) {
//                                 return DropdownMenuItem<String>(
//                                   value: size,
//                                   child: Text(size),
//                                 );
//                               }).toList(),
//                               onChanged: (String? newValue) {
//                                 if (newValue != null) {
//                                   setState(() {
//                                     _selectedSize = newValue;
//                                   });
//                                 }
//                               },
//                             ),
//                             const SizedBox(height: 16),
                            
//                             // Color field
//                             TextFormField(
//                               controller: _colorController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Preferred Color',
//                                 border: OutlineInputBorder(),
//                                 prefixIcon: Icon(Icons.color_lens),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter a color';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 16),
                            
//                             // Notes field
//                             TextFormField(
//                               controller: _notesController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Additional Notes',
//                                 border: OutlineInputBorder(),
//                                 prefixIcon: Icon(Icons.note),
//                                 alignLabelWithHint: true,
//                               ),
//                               maxLines: 3,
//                             ),
//                             const SizedBox(height: 24),
                            
//                             // Submit button with animation
//                             SlideTransition(
//                               position: Tween<Offset>(
//                                 begin: const Offset(0, 0.5),
//                                 end: Offset.zero,
//                               ).animate(CurvedAnimation(
//                                 parent: _animationController,
//                                 curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic),
//                               )),
//                               child: FadeTransition(
//                                 opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
//                                   CurvedAnimation(
//                                     parent: _animationController,
//                                     curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
//                                   ),
//                                 ),
//                                 child: SizedBox(
//                                   width: double.infinity,
//                                   child: ElevatedButton(
//                                     onPressed: _submitForm,
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.black,
//                                       foregroundColor: Colors.white,
//                                       padding: const EdgeInsets.symmetric(vertical: 16),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                       ),
//                                     ),
//                                     child: const Text('Submit Details'),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
