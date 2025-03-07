import 'package:all/data/data_check_out.dart';
 import 'package:all/screens/home/service_view/check_out/widget/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListviewCheckOut extends StatefulWidget {
  const CustomListviewCheckOut({super.key});

  @override
  State<CustomListviewCheckOut> createState() => _CustomListviewCheckOutState();
}

class _CustomListviewCheckOutState extends State<CustomListviewCheckOut> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demoCarts.length,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(demoCarts[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [const Spacer(), SvgPicture.string(trashIcon)],
                ),
              ),
              child: CartCard(cart: demoCarts[index]),
            ),
          ),
    );
  }
}








 