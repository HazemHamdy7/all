import 'package:all/constants/assets.dart';
import 'package:flutter/material.dart';

class FirstCardAtHome extends StatelessWidget {
  const FirstCardAtHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you in an emergercy?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  ' press thr jkbdkjbvjkbsdkjvbjkxjkv bjkjkd vjl',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Image.asset(Assets.imageOnboarding, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
