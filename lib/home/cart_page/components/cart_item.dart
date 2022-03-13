import 'package:ecom/api/responses.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Products product;
  final Function onClick;
  const CartItem({Key? key, required this.product, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(product.name!),
    );
  }
}
