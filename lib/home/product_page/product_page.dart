import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/api/responses.dart';
import 'package:ecom/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/api_models.dart';
import '../../utils/DataHolder.dart';
import '../../utils/user_interface_utils.dart';

class SingleProductPage extends StatefulWidget {
  final Products? products;
  const SingleProductPage({Key? key, this.products}) : super(key: key);

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  int quantity = 1;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildSlider(widget.products!.images!),
                    getProductDetails(),
                  ],
                ),
              ),
            ),
            getButtons(),
          ]),
          SafeArea(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
        ],
      ),
    );
  }

  buildSlider(List<String> url) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 350.0,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: url.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(
                        imageUrl: i,
                        fit: BoxFit.contain,
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 0,
          left: (MediaQuery.of(context).size.width) / 2 - 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: url.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 20.0,
                  height: 2.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  getProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            widget.products!.name!,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                letterSpacing: .5,
                fontSize: 22,
              ),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Text(
                  "Rs. ${widget.products!.discountPrice}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
                Text(
                  " ${widget.products!.price}",
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                Text(
                  "   (${((1 - widget.products!.discountPrice! / widget.products!.price!) * 100).toInt()} %OFF)",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "  All inclusive tax",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Divider(
            height: 2,
            color: Colors.grey.shade500,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Text("PRODUCT DESCRIPTION",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            widget.products!.description!,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }

  getButtons() {
    return Container(
      height: 70,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 0.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
        color: kPrimaryColor,
      ),
      child: InkWell(
          onTap: () {
            OnlineModel.addToCart(
              apiKey: DataHolder.loginResponse!.apiKey!,
              pid: widget.products!.id!,
              quanity: quantity,
              success: (resp) {
                UserInterfaceUtils.showSnackBar(resp, context);
              },
              fail: (msg) {
                UserInterfaceUtils.showSnackBar(msg, context);
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "ADD TO CART",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 25,
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (quantity < 10) {
                          setState(() {
                            quantity++;
                          });
                        }
                      },
                      icon:
                          const Icon(Icons.add, size: 18, color: Colors.white)),
                  Text(
                    "$quantity",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove,
                          size: 18, color: Colors.white))
                ]),
              ),
            ],
          )),
    );
  }
}
