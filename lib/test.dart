// import 'package:all/constants/assets.dart';
// import 'package:all/model/dress_code.dart';
// import 'package:all/screens/home/services/vehicle_selection_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class DressCodeScreen extends StatefulWidget {
//   const DressCodeScreen({Key? key}) : super(key: key);

//   @override
//   State<DressCodeScreen> createState() => _DressCodeScreenState();
// }

// class _DressCodeScreenState extends State<DressCodeScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//   final List<DressCode> dressCodeOptions = [
//     DressCode(
//       name: 'Tactical Casual',
//       image: 'assets/image/white_car.png',
//       description: 'Protectors tailor their uniform for any occasion.',
//     ),
//     DressCode(
//       name: 'Business Casual',
//       image: 'assets/image/man1.jpg',
//       description: 'Protectors tailor their uniform for any occasion.',
//     ),
//     DressCode(
//       name: 'Formal',
//       image: 'assets/image/onboarding.png',
//       description: 'Protectors tailor their uniform for any occasion.',
//     ),
//   ];

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _nextPage() {
//     if (_currentPage < dressCodeOptions.length - 1) {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const VehicleSelectionScreen()),
//       );
//     }
//   }

//   void _previousPage() {
//     if (_currentPage > 0) {
//       _pageController.previousPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Back Button
//           Positioned(
//             top: 48,
//             left: 16,
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.maybePop(context);
//               },
//             ),
//           ),

//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,
//               onPageChanged: (int page) {
//                 setState(() {
//                   _currentPage = page;
//                 });
//               },
//               itemCount: dressCodeOptions.length,
//               itemBuilder: (context, index) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Image.asset(
//                         dressCodeOptions[index].image,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Text(
//                       'Pick Dress Code',
//                       style: Theme.of(context).textTheme.headlineSmall,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       dressCodeOptions[index].description,
//                       style: Theme.of(
//                         context,
//                       ).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
//                     ),
//                     const SizedBox(height: 24),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.chevron_left),
//                           onPressed: _currentPage > 0 ? _previousPage : null,
//                         ),
//                         const SizedBox(width: 16),
//                         Text(
//                           dressCodeOptions[index].name,
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                         const SizedBox(width: 16),
//                         IconButton(
//                           icon: const Icon(Icons.chevron_right),
//                           onPressed:
//                               _currentPage < dressCodeOptions.length - 1
//                                   ? _nextPage
//                                   : null,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey[300]!),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: _nextPage,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Colors.black,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           child: const Text('Next'),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 48),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:all/model/dress_code.dart';
import 'package:all/screens/home/service_view/widget/dress_code_screen.dart';
import 'package:flutter/material.dart';
