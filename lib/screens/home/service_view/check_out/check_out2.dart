import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Your Orders"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // List of cart items
              ...List.generate(
                demoItems.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: OrderedItemCard(
                    title: demoItems[index]["title"],
                    description:
                        "Shortbread, chocolate turtle cookies, and red velvet.",
                    numOfItem: demoItems[index]["numOfItem"],
                    price: demoItems[index]["price"].toDouble(),
                  ),
                ),
              ),
              const PriceRow(text: "Subtotal", price: 28.0),
              const SizedBox(height: 8),
              const PriceRow(text: "Delivery", price: 0),
              const SizedBox(height: 8),
              const TotalPrice(price: 20),
              const SizedBox(height: 32),
              PrimaryButton(text: "Checkout (\$20.10)", press: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final GestureTapCallback press;

  const PrimaryButton({super.key, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 16);
    return SizedBox(
      width: double.infinity,
      child:
          Platform.isIOS
              ? CupertinoButton(
                padding: verticalPadding,
                color: const Color(0xFF22A45D),
                onPressed: press,
                child: buildText(context),
              )
              : ElevatedButton(
                style: TextButton.styleFrom(
                  padding: verticalPadding,
                  backgroundColor: const Color(0xFF22A45D),
                ),
                onPressed: press,
                child: buildText(context),
              ),
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text.rich(
          TextSpan(
            text: "Total ",
            style: TextStyle(
              color: Color(0xFF22A45D),
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: "(incl. VAT)",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Text(
          "\$$price",
          style: const TextStyle(
            color: Color(0xFF22A45D),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.text, required this.price});

  final String text;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(color: Color(0xFF010F07))),
        Text("\$$price", style: const TextStyle(color: Color(0xFF010F07))),
      ],
    );
  }
}

class OrderedItemCard extends StatelessWidget {
  const OrderedItemCard({
    super.key,
    required this.numOfItem,
    required this.title,
    required this.description,
    required this.price,
  });
  final int numOfItem;
  final String? title, description;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NumOfItems(numOfItem: numOfItem),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title!, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "USD$price",
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: const Color(0xFF22A45D)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }
}

class NumOfItems extends StatelessWidget {
  const NumOfItems({super.key, required this.numOfItem});

  final int numOfItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          width: 0.5,
          color: const Color(0xFF868686).withOpacity(0.5),
        ),
      ),
      child: Text(
        numOfItem.toString(),
        style: Theme.of(
          context,
        ).textTheme.labelLarge!.copyWith(color: const Color(0xFF22A45D)),
      ),
    );
  }
}

const List<Map> demoItems = [
  {"title": "Cookie Sandwich", "price": 7.4, "numOfItem": 1},
  {"title": "Combo Burger", "price": 12, "numOfItem": 1},
  {"title": "Oyster Dish", "price": 8.6, "numOfItem": 2},
];
