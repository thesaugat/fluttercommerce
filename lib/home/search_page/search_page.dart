import 'package:ecom/utils/constants.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 40,
        child: TextField(
          onSubmitted: (value) {
            serchProduct(value);
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstants.kGreyColor,
                  width: 0.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstants.kGreyColor,
                  width: 0.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstants.kGreyColor, width: 0.0),
              ),
              hintText: "Search Product Name",
              contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
        ),
        decoration: BoxDecoration(
            color: kInputColor, borderRadius: BorderRadius.circular(10)),
      ),
    ));
  }

  void serchProduct(String value) {}
}
