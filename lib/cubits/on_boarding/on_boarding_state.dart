abstract class OnboardingState {
  final int currentPage;

  OnboardingState(this.currentPage);
}

class OnboardingInitial extends OnboardingState {
  OnboardingInitial() : super(0);
}

class OnboardingPageChanged extends OnboardingState {
  OnboardingPageChanged(super.currentPage);
}
