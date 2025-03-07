import 'package:all/screens/home/service_view/check_out/widget/checkout_card.dart';
import 'package:all/screens/home/service_view/check_out/widget/custom_listview_check_out.dart';
import 'package:all/screens/home/service_view/check_out/widget/cutom_app_bar_check_out.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CutomAppBarCheckOut(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomListviewCheckOut(),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}

// Our demo Products
