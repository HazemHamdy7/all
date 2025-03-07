import 'package:all/cubits/on_boarding/on_boarding_state.dart';
import 'package:all/screens/home/home_screen.dart';
 
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController(initialPage: 0);

  OnboardingCubit() : super(OnboardingInitial());

  void onPageChanged(int index) {
    emit(OnboardingPageChanged(index));
  }

  void navigateToNextPage(BuildContext context, List<Widget> pages) {
    if (state.currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnboardingPageChanged(state.currentPage + 1));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void navigateToPreviousPage() {
    if (state.currentPage > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnboardingPageChanged(state.currentPage - 1));
    }
  }
}
