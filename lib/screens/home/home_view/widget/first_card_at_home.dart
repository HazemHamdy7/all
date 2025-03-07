import 'package:all/constants/assets.dart';
import 'package:flutter/material.dart';

class FirstCardAtHome extends StatelessWidget {
  final String title;
  final String subTiltle;
  final String image;
  final void Function() onPressed;
  const FirstCardAtHome({
    super.key,
    required this.title,
    required this.subTiltle,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.black,
        shadowColor: Colors.blue,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 190,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      subTiltle,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(child: Image.asset(image, fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
