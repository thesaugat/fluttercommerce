import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/api/responses.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Products product;
  final Function onClick;
  final Function onDelete;

  const CartItem(
      {Key? key,
      required this.product,
      required this.onClick,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.12),
          borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: SizedBox(
          width: MediaQuery.of(context).size.width * .15,
          child: CachedNetworkImage(
            imageUrl: product.images!.first,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(product.name!),
        subtitle: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text("Rs. ${product.discountPrice!}"),
          IconButton(
              onPressed: () {
                onDelete();
              },
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red.withOpacity(.5),
              ))
        ]),
      ),
    );
  }
}
