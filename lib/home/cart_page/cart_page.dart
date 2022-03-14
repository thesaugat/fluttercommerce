import 'package:ecom/home/cart_page/components/cart_item.dart';
import 'package:ecom/utils/DataHolder.dart';
import 'package:ecom/utils/constants.dart';
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
  double total = 0.0;
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
            ? Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () => refresh(),
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          separatorBuilder: (context, index) => const Divider(),
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
                                      UserInterfaceUtils.showSnackBar(
                                          msg, context);
                                    },
                                    fail: (msg) {
                                      UserInterfaceUtils.showSnackBar(
                                          msg, context);
                                    });
                              },
                            );
                          }),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                    height: 60,
                    child: Row(children: [
                      Expanded(
                        child: Text(
                          "    Total: Rs ${total.toInt()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            style:
                                ElevatedButton.styleFrom(primary: Colors.amber),
                            icon: const Icon(Icons.shopify),
                            label: const Text("Check Out")),
                      )
                    ]),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  Future<void> refresh() async {
    getCartItems();
  }

  setTotal() {
    total = 0.0;
    for (var element in productList!) {
      total = total + (element.discountPrice! * element.cart_quantity!);
    }
  }

  void getCartItems() {
    String apiKey = DataHolder.loginResponse!.apiKey!;
    OnlineModel.getCart(
      apiKey: apiKey,
      success: (List<Products> data) {
        setState(() {
          productList = data;
          setTotal();
        });
      },
      fail: (msg) {
        // print("failed cart $msg");
      },
    );
  }
}
