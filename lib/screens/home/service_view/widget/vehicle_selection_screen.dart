// import 'package:all/constants/assets.dart';
//  import 'package:flutter/material.dart';

// class VehicleSelectionScreen extends StatefulWidget {
//   const VehicleSelectionScreen({super.key});

//   @override
//   State<VehicleSelectionScreen> createState() => _VehicleSelectionScreenState();
// }

// class _VehicleSelectionScreenState extends State<VehicleSelectionScreen> {
//   int _carCount = 1;

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
//                 Navigator.pop(context);
//               },
//             ),
//           ),

//           // Main Content
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   Assets.imageCarImage,

//                   height: 200,
//                   fit: BoxFit.contain,
//                 ),
//                 const SizedBox(height: 24),
//                 Text(
//                   'Escalade or Similar Vehicle • Fits 5 Protectees',
//                   style: Theme.of(
//                     context,
//                   ).textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   'How many cars do you want in your motorcade?',
//                   style: Theme.of(context).textTheme.headlineSmall,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   'Each car comes with a dedicated driver for the duration of your protection. Based on your booking details, you will require 1 car.',
//                   style: Theme.of(
//                     context,
//                   ).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 32),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.remove),
//                       onPressed:
//                           _carCount > 1
//                               ? () {
//                                 setState(() {
//                                   _carCount--;
//                                 });
//                               }
//                               : null,
//                     ),
//                     const SizedBox(width: 24),
//                     Text(
//                       _carCount.toString(),
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                     const SizedBox(width: 24),
//                     IconButton(
//                       icon: const Icon(Icons.add),
//                       onPressed: () {
//                         setState(() {
//                           _carCount++;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 32),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.black,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     child: const Text('Next'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
