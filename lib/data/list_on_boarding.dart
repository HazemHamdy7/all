import 'package:all/constants/assets.dart';
import 'package:all/screens/on_boarding/widget/custom_on_boarding.dart';
import 'package:flutter/material.dart';

final List<Widget> pages = [
  OnboardingPage(
    image: Assets.imageCarImage,
    title: 'Welcome to MyApp',
    description:
        'Discover amazing features and tools to make your life easier.',
  ),
  OnboardingPage(
    image: Assets.imageWhiteCar,
    title: 'Stay Organized',
    description: 'Keep track of your tasks and goals effortlessly.',
  ),
  OnboardingPage(
    image: Assets.imageCarImage,
    title: 'Get Started',
    description:
        'Join thousands of users who are already benefiting from MyApp.',
  ),
];
