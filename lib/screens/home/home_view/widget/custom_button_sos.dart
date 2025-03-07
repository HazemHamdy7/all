import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

// class EmergencyType {
//   final String name;
//   final IconData icon;
//   final Color color;

//   EmergencyType({required this.name, required this.icon, required this.color});
// }

class CustomButtonSOS extends StatefulWidget {
  const CustomButtonSOS({super.key});

  @override
  State<CustomButtonSOS> createState() => _CustomButtonSOSState();
}

class _CustomButtonSOSState extends State<CustomButtonSOS> with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _pressController;
  bool _isPressed = false;

  // final List<EmergencyType> emergencyTypes = [
  //   EmergencyType(
  //     name: 'Medical',
  //     icon: Icons.medical_services_outlined,
  //     color: Color(0xFF4CAF50),
  //   ),
  //   EmergencyType(
  //     name: 'Fire',
  //     icon: Icons.local_fire_department_outlined,
  //     color: Color(0xFFFF5722),
  //   ),
  //   EmergencyType(
  //     name: 'Natural disaster',
  //     icon: Icons.waves_outlined,
  //     color: Color(0xFF009688),
  //   ),
  //   EmergencyType(
  //     name: 'Accident',
  //     icon: Icons.car_crash_outlined,
  //     color: Color(0xFF2196F3),
  //   ),
  //   EmergencyType(
  //     name: 'Violence',
  //     icon: Icons.flash_on_outlined,
  //     color: Color(0xFFE91E63),
  //   ),
  //   EmergencyType(
  //     name: 'Rescue',
  //     icon: Icons.support_outlined,
  //     color: Color(0xFFFFC107),
  //   ),
  // ];

  @override
  void initState() {
    super.initState();

    // Wave animation controller
    _waveController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    // Press animation controller
    _pressController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _waveController.dispose();
    _pressController.dispose();
    super.dispose();
  }

  void _onSOSPressed() {
    setState(() {
      _isPressed = true;
    });
    _pressController.forward();
    HapticFeedback.heavyImpact();

    // Simulate button release after 200ms
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _isPressed = false;
        });
        _pressController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          // SOS Button with Sound Waves
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Sound Waves
                  ...List.generate(3, (index) {
                    return AnimatedBuilder(
                      animation: _waveController,
                      builder: (context, child) {
                        final double delay = index * 0.3;
                        final double progress =
                            (_waveController.value + delay) % 1.0;

                        return Opacity(
                          opacity: math.max(0, 1 - progress),
                          child: Transform.scale(
                            scale: .7 + (progress * .8),
                            child: Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFFF87C6D).withOpacity(0.5),
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),

                  // SOS Button
                  GestureDetector(
                    onTapDown: (_) => _onSOSPressed(),
                    child: AnimatedBuilder(
                      animation: _pressController,
                      builder: (context, child) {
                        final scale = 1.0 - (_pressController.value * 0.05);

                        return Transform.scale(
                          scale: scale,
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white10,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      _isPressed
                                          ? Colors.red.withOpacity(0.5)
                                          : Color(0xFFF87C6D),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'SOS',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Press 5 seconds',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 40),
          // // Emergency Type Question
          // const Text(
          //   "What's your emergency?",
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.w500,
          //     color: Colors.black87,
          //   ),
          // ),
          // const SizedBox(height: 30),
          // // Emergency Types Grid
          // Expanded(
          //   child: GridView.builder(
          //     physics: NeverScrollableScrollPhysics(),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3,
          //       childAspectRatio: 1.0,
          //       crossAxisSpacing: 16,
          //       mainAxisSpacing: 16,
          //     ),
          //     itemCount: emergencyTypes.length,
          //     itemBuilder: (context, index) {
          //       return EmergencyTypeCard(
          //         emergencyType: emergencyTypes[index],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

// class EmergencyTypeCard extends StatefulWidget {
//   final EmergencyType emergencyType;

//   const EmergencyTypeCard({Key? key, required this.emergencyType})
//     : super(key: key);

//   @override
//   State<EmergencyTypeCard> createState() => _EmergencyTypeCardState();
// }

// class _EmergencyTypeCardState extends State<EmergencyTypeCard> {
//   bool _isPressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) {
//         setState(() => _isPressed = true);
//         HapticFeedback.mediumImpact();
//       },
//       onTapUp: (_) {
//         setState(() => _isPressed = false);
//       },
//       onTapCancel: () {
//         setState(() => _isPressed = false);
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 150),
//         transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
//         child: Column(
//           children: [
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: widget.emergencyType.color,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 widget.emergencyType.icon,
//                 size: 28,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               widget.emergencyType.name,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
