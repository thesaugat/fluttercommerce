import 'package:ecom/home/cart_page/components/cart_item.dart';
import 'package:ecom/utils/DataHolder.dart';
import 'package:flutter/material.dart';

import '../../api/responses.dart';
import '../../models/api_models.dart';
import '../../utils/user_interface_utils.dart';

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
            ? ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 18),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: productList!.length,
                itemBuilder: (context, index) {
                  return CartItem(
                    product: productList![index],
                    onClick: () {},
                    onDelete: () {
                      OnlineModel.removeFromCart(
                          apiKey: DataHolder.loginResponse!.apiKey,
                          cid: productList![index].cart_id!,
                          success: (msg) {
                            setState(() {
                              productList!.removeAt(index);
                            });
                            UserInterfaceUtils.showSnackBar(msg, context);
                          },
                          fail: (msg) {
                            UserInterfaceUtils.showSnackBar(msg, context);
                          });
                    },
                  );
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
