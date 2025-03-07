// import 'package:all/cubits/on_boarding/on_boarding_cubit.dart';
// import 'package:all/cubits/on_boarding/on_boarding_state.dart';
// import 'package:all/data/list_on_boarding.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => OnboardingCubit(),
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: BlocBuilder<OnboardingCubit, OnboardingState>(
//           builder: (context, state) {
//             final cubit = context.read<OnboardingCubit>();
//             return Stack(
//               children: [
//                 PageView(
//                   controller: cubit.pageController,
//                   onPageChanged: cubit.onPageChanged,
//                   children: pages,
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: SmoothPageIndicator(
//                       controller: cubit.pageController,
//                       count: pages.length,
//                       effect: WormEffect(
//                         dotHeight: 8,
//                         dotWidth: 8,
//                         spacing: 4,
//                         dotColor: Colors.grey,
//                         activeDotColor: Colors.indigo,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 20,
//                   child: Visibility(
//                     visible: state.currentPage > 0,
//                     child: FloatingActionButton(
//                       heroTag: 'previousButton',
//                       onPressed: cubit.navigateToPreviousPage,
//                       child: Icon(Icons.arrow_back),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   right: 20,
//                   child: FloatingActionButton(
//                     heroTag: 'nextButton',
//                     onPressed: () => cubit.navigateToNextPage(context, pages),
//                     child: Icon(
//                       state.currentPage == pages.length - 1
//                           ? Icons.check
//                           : Icons.arrow_forward,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:all/cubits/on_boarding/on_boarding_cubit.dart';
import 'package:all/cubits/on_boarding/on_boarding_state.dart';
import 'package:all/data/list_on_boarding.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            final cubit = context.read<OnboardingCubit>();
            return Stack(
              children: [
                PageView(
                  controller: cubit.pageController,
                  onPageChanged: cubit.onPageChanged,
                  children: pages,
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: cubit.pageController,
                      count: pages.length,
                      effect: WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 4,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Visibility(
                    visible: state.currentPage > 0,
                    child: FloatingActionButton(
                      backgroundColor: Colors.black,

                      heroTag: 'previousButton',
                      onPressed: cubit.navigateToPreviousPage,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    heroTag: 'nextButton',
                    onPressed: () => cubit.navigateToNextPage(context, pages),
                    child:
                        state.currentPage == pages.length - 1
                            ? Icon(Icons.check)
                            : Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
