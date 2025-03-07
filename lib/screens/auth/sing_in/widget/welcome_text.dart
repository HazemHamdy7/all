import 'package:flutter/material.dart';

class UserWelcomeText extends StatelessWidget {
  final String title, text;

  const UserWelcomeText({super.key, required this.title, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16 / 2),
        Text(text, style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 24),
      ],
    );
  }
}
