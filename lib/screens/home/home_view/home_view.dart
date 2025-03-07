import 'package:all/constants/assets.dart';
import 'package:all/screens/home/home_view/widget/custom_button_sos.dart';
import 'package:all/screens/home/home_view/widget/first_card_at_home.dart';
 import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        child: Column(
          children: [
            FirstCardAtHome(
              title: 'Are you an emergency?',
              subTiltle:
                  'press the button below to get help immediately from the nearest police station',
              onPressed: () {},
              image: Assets.imageLogo2,
            ),

            CustomButtonSOS(),
          ],
        ),
      ),
    );
  }
}
