import 'package:all/constants/assets.dart';
import 'package:all/cubits/dress_cubit/dress_code_cubit.dart';
import 'package:all/screens/home/home_view/widget/first_card_at_home.dart';
import 'package:all/screens/home/service_view/widget/dress_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainService extends StatelessWidget {
  const MainService({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        spacing: 10,
        children: [
          FirstCardAtHome(
            title: 'Dress Code',
            subTiltle:
                'press the button below to get help immediately from the nearest police station',
            image: Assets.imageBodyguardPng18,
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => BlocProvider.value(
                          value: context.read<DressCodeCubit>(),
                          child: const DressCodeScreen(),
                        ),
                  ),
                ),
          ),
          FirstCardAtHome(
            title: 'Choose your car',
            subTiltle:
                'press the button below to get help immediately from the nearest police station',
            image: Assets.imageOnboarding,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
