import 'package:ecom/home/cart_page/components/cart_item.dart';
import 'package:ecom/utils/DataHolder.dart';
import 'package:flutter/material.dart';

import '../../api/responses.dart';
import '../../models/api_models.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Products>? productList;
  @override
  void initState() {
    super.initState();
    getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cart")),
        body: productList != null
            ? ListView.builder(
                itemCount: productList!.length,
                itemBuilder: (context, index) {
                  return CartItem(product: productList![index], onClick: () {});
                })
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  void getCartItems() {
    String apiKey = DataHolder.loginResponse!.apiKey!;
    OnlineModel.getCart(
      apiKey: apiKey,
      success: (List<Products> data) {
        setState(() {
          productList = data.reversed.toList();
        });
      },
      fail: (msg) {
        print("failed cart $msg");
      },
    );
  }
}
