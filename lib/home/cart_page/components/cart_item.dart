import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/api/responses.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Products product;
  final Function onClick;
  final Function? onDelete;

  const CartItem(
      {Key? key, required this.product, required this.onClick, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            width: 90,
            height: 110,
            child: CachedNetworkImage(
              imageUrl: product.images!.first,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    product.name!,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 40,
                    child: IconButton(
                        onPressed: () {
                          if (onDelete != null) onDelete!();
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: onDelete != null
                              ? Colors.red.withOpacity(.5)
                              : Colors.transparent,
                        )),
                  )
                ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Rs. ${product.discountPrice! * product.cart_quantity!}"),
                Text("    Qty. ${product.cart_quantity!}"),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
