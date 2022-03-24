import 'package:ecom/api/responses.dart';
import 'package:ecom/home/address/address_page.dart';
import 'package:ecom/home/cart_page/cart_page.dart';
import 'package:ecom/home/cart_page/components/cart_item.dart';
import 'package:ecom/models/api_models.dart';
import 'package:ecom/utils/DataHolder.dart';
import 'package:ecom/utils/constants.dart';
import 'package:ecom/utils/user_interface_utils.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  final List<Products> productList;
  final double total;
  const CheckOutPage({Key? key, required this.productList, required this.total})
      : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  bool isCod = true;
  Adresses? adresses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(children: [
              addressLayout(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: kPrimaryColor,
                height: 50,
                child: Row(children: [
                  const Text(
                    "Your Cart",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 14),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: kPrimaryColordark,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "${widget.productList.length} Items",
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ]),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: ((context, index) => CartItem(
                        product: widget.productList[index],
                        onClick: () {},
                      )),
                  itemCount: widget.productList.length,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Payment Type",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isCod = true;
                              });
                            },
                            icon: Icon(
                              Icons.delivery_dining,
                              color: isCod ? kPrimaryColor : null,
                              size: 40,
                            )),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isCod = false;
                              });
                            },
                            icon: Icon(
                              Icons.paypal,
                              color: !isCod ? kPrimaryColor : null,
                              size: 40,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Delivery Chagre:",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Free",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Sub Total:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Rs. ${widget.total}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            height: 100,
            width: double.infinity,
            color: Colors.white,
            child: TextButton(
              onPressed: () {
                if (adresses != null) {
                  OnlineModel.order(
                      apiKey: DataHolder.loginResponse!.apiKey,
                      addressId: adresses!.id!,
                      ptype: isCod ? 1 : 2,
                      paymentRefrence: isCod ? "COD" : "2",
                      success: (resp) {
                        UserInterfaceUtils.showSnackBar(
                            "Your order is successflly placed! Wait 2-3 working days to get it delivered!",
                            context);

                        Navigator.pop(context);
                      },
                      fail: (msg) {
                        UserInterfaceUtils.showSnackBar(msg, context);
                      });
                }
              },
              child: const Text("Check Out",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  addressLayout() {
    return GestureDetector(
      onTap: () {
        openAddressSelection();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        height: 90,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: adresses == null
                ? const Text("Select a Address")
                : ListTile(
                    leading: const Icon(
                      Icons.location_city_rounded,
                      size: 40,
                    ),
                    title: Text(adresses!.city!),
                    subtitle: Text(
                        "${adresses!.description!} | ${adresses!.province!} | ${adresses!.street!}"),
                  )),
      ),
    );
  }

  void openAddressSelection() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: MediaQuery.of(context).size.height,
          child: const AddressPage(),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          adresses = value;
        });
      }
    });
  }
}
