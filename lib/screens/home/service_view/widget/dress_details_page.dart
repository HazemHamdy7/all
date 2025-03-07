// // import 'package:flutter/material.dart';
// // import 'dress_code_screen.dart';

// // class DressDetailsScreen extends StatefulWidget {
// //   final DressCode selectedDressCode;

// //   const DressDetailsScreen({Key? key, required this.selectedDressCode})
// //     : super(key: key);

// //   @override
// //   State<DressDetailsScreen> createState() => _DressDetailsScreenState();
// // }

// // class _DressDetailsScreenState extends State<DressDetailsScreen> {
// //   final _formKey = GlobalKey<FormState>();

// //   // Form controllers
// //   final _nameController = TextEditingController();
// //   final _sizeController = TextEditingController();
// //   final _colorController = TextEditingController();
// //   final _notesController = TextEditingController();

// //   String _selectedSize = 'Wis Gun'; // Default size

// //   final List<String> _availableSizes = ['Wis Gun', 'Not Gun'];

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _sizeController.dispose();
// //     _colorController.dispose();
// //     _notesController.dispose();
// //     super.dispose();
// //   }

// //   void _submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       // Process the form data
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(
// //             'Dress details submitted for ${widget.selectedDressCode.name}',
// //           ),
// //           backgroundColor: Colors.green,
// //         ),
// //       );

// //       // Navigate back to the first screen or to a confirmation screen
// //       Navigator.pop(context);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Dress Details - ${widget.selectedDressCode.name}'),
// //         backgroundColor: Colors.black,
// //         foregroundColor: Colors.white,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Dress code info card
// //               Card(
// //                 elevation: 4,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(16),
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     // Dress image
// //                     ClipRRect(
// //                       borderRadius: const BorderRadius.vertical(
// //                         top: Radius.circular(16),
// //                       ),
// //                       child: Image.asset(
// //                         widget.selectedDressCode.image,
// //                         height: 300,
// //                         width: double.infinity,
// //                         fit: BoxFit.fitWidth,
// //                       ),
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.all(16.0),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             widget.selectedDressCode.name,
// //                             style: const TextStyle(
// //                               fontSize: 22,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           const SizedBox(height: 8),
// //                           Text(
// //                             widget.selectedDressCode.description,
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               color: Colors.grey[600],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               // Dress details form
// //               // Form(
// //               //   key: _formKey,
// //               //   child: Card(
// //               //     elevation: 4,
// //               //     shape: RoundedRectangleBorder(
// //               //       borderRadius: BorderRadius.circular(16),
// //               //     ),
// //               //     child: Padding(
// //               //       padding: const EdgeInsets.all(16.0),
// //               //       child: Column(
// //               //         crossAxisAlignment: CrossAxisAlignment.start,
// //               //         children: [
// //               //           const Text(
// //               //             'Enter Dress Details',
// //               //             style: TextStyle(
// //               //               fontSize: 20,
// //               //               fontWeight: FontWeight.bold,
// //               //             ),
// //               //           ),
// //               //           const SizedBox(height: 16),

// //               //           // Name field
// //               //           TextFormField(
// //               //             controller: _nameController,
// //               //             decoration: const InputDecoration(
// //               //               labelText: 'Your Name',
// //               //               border: OutlineInputBorder(),
// //               //               prefixIcon: Icon(Icons.person),
// //               //             ),
// //               //             validator: (value) {
// //               //               if (value == null || value.isEmpty) {
// //               //                 return 'Please enter your name';
// //               //               }
// //               //               return null;
// //               //             },
// //               //           ),
// //               //           const SizedBox(height: 16),

// //               //           // Size dropdown
// //               //           DropdownButtonFormField<String>(
// //               //             value: _selectedSize,
// //               //             decoration: const InputDecoration(
// //               //               labelText: 'Size',
// //               //               border: OutlineInputBorder(),
// //               //               prefixIcon: Icon(Icons.straighten),
// //               //             ),
// //               //             items:
// //               //                 _availableSizes.map((String size) {
// //               //                   return DropdownMenuItem<String>(
// //               //                     value: size,
// //               //                     child: Text(size),
// //               //                   );
// //               //                 }).toList(),
// //               //             onChanged: (String? newValue) {
// //               //               if (newValue != null) {
// //               //                 setState(() {
// //               //                   _selectedSize = newValue;
// //               //                 });
// //               //               }
// //               //             },
// //               //           ),
// //               //           const SizedBox(height: 16),

// //               //           // Color field
// //               //           TextFormField(
// //               //             controller: _colorController,
// //               //             decoration: const InputDecoration(
// //               //               labelText: 'Preferred Color',
// //               //               border: OutlineInputBorder(),
// //               //               prefixIcon: Icon(Icons.color_lens),
// //               //             ),
// //               //             validator: (value) {
// //               //               if (value == null || value.isEmpty) {
// //               //                 return 'Please enter a color';
// //               //               }
// //               //               return null;
// //               //             },
// //               //           ),
// //               //           const SizedBox(height: 16),

// //               //           // Notes field
// //               //           TextFormField(
// //               //             controller: _notesController,
// //               //             decoration: const InputDecoration(
// //               //               labelText: 'Additional Notes',
// //               //               border: OutlineInputBorder(),
// //               //               prefixIcon: Icon(Icons.note),
// //               //               alignLabelWithHint: true,
// //               //             ),
// //               //             maxLines: 3,
// //               //           ),
// //               //           const SizedBox(height: 24),

// //               //           // Submit button
// //               //           SizedBox(
// //               //             width: double.infinity,
// //               //             child: ElevatedButton(
// //               //               onPressed: _submitForm,
// //               //               style: ElevatedButton.styleFrom(
// //               //                 backgroundColor: Colors.black,
// //               //                 foregroundColor: Colors.white,
// //               //                 padding: const EdgeInsets.symmetric(vertical: 16),
// //               //                 shape: RoundedRectangleBorder(
// //               //                   borderRadius: BorderRadius.circular(30),
// //               //                 ),
// //               //               ),
// //               //               child: const Text('Submit Details'),
// //               //             ),
// //               //           ),
// //               //         ],
// //               //       ),
// //               //     ),
// //               //   ),
// //               // ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'dress_code_screen.dart';

// class DressDetailsScreen extends StatefulWidget {
//   final DressCode selectedDressCode;

//   const DressDetailsScreen({Key? key, required this.selectedDressCode})
//     : super(key: key);

//   @override
//   State<DressDetailsScreen> createState() => _DressDetailsScreenState();
// }

// class _DressDetailsScreenState extends State<DressDetailsScreen>
//     with SingleTickerProviderStateMixin {
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
//           content: Text(
//             'Dress details submitted for ${widget.selectedDressCode.name}',
//           ),
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
//                 ).animate(
//                   CurvedAnimation(
//                     parent: _animationController,
//                     curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
//                   ),
//                 ),
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
//                           borderRadius: const BorderRadius.vertical(
//                             top: Radius.circular(16),
//                           ),
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
//                 ).animate(
//                   CurvedAnimation(
//                     parent: _animationController,
//                     curve: const Interval(0.3, 0.8, curve: Curves.easeOutCubic),
//                   ),
//                 ),
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
//                             // Size dropdown
//                             // DropdownButtonFormField<String>(
//                             //   value: _selectedSize,
//                             //   decoration: const InputDecoration(
//                             //     labelText: 'Size',
//                             //     border: OutlineInputBorder(),
//                             //     prefixIcon: Icon(Icons.straighten),
//                             //   ),
//                             //   items:
//                             //       _availableSizes.map((String size) {
//                             //         return DropdownMenuItem<String>(
//                             //           value: size,
//                             //           child: Text(size),
//                             //         );
//                             //       }).toList(),
//                             //   onChanged: (String? newValue) {
//                             //     if (newValue != null) {
//                             //       setState(() {
//                             //         _selectedSize = newValue;
//                             //       });
//                             //     }
//                             //   },
//                             // ),
//                             // const SizedBox(height: 16),

//                             // Color field
//                             // TextFormField(
//                             //   controller: _colorController,
//                             //   decoration: const InputDecoration(
//                             //     labelText: 'Preferred Color',
//                             //     border: OutlineInputBorder(),
//                             //     prefixIcon: Icon(Icons.color_lens),
//                             //   ),
//                             //   validator: (value) {
//                             //     if (value == null || value.isEmpty) {
//                             //       return 'Please enter a color';
//                             //     }
//                             //     return null;
//                             //   },
//                             // ),
//                             // const SizedBox(height: 16),

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
//                               ).animate(
//                                 CurvedAnimation(
//                                   parent: _animationController,
//                                   curve: const Interval(
//                                     0.6,
//                                     1.0,
//                                     curve: Curves.easeOutCubic,
//                                   ),
//                                 ),
//                               ),
//                               child: FadeTransition(
//                                 opacity: Tween<double>(
//                                   begin: 0.0,
//                                   end: 1.0,
//                                 ).animate(
//                                   CurvedAnimation(
//                                     parent: _animationController,
//                                     curve: const Interval(
//                                       0.6,
//                                       1.0,
//                                       curve: Curves.easeOut,
//                                     ),
//                                   ),
//                                 ),
//                                 child: SizedBox(
//                                   width: double.infinity,
//                                   child: ElevatedButton(
//                                     onPressed: _submitForm,
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.black,
//                                       foregroundColor: Colors.white,
//                                       padding: const EdgeInsets.symmetric(
//                                         vertical: 16,
//                                       ),
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
import 'package:all/model/dress_code.dart';
import 'package:flutter/material.dart';

class DressDetailsPage extends StatelessWidget {
  final DressCode dressCode;

  const DressDetailsPage({super.key, required this.dressCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dressCode.name),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  dressCode.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dressCode.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      dressCode.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter additional details',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Process submission here.
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
