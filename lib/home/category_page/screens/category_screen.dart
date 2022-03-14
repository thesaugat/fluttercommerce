import 'package:ecom/home/home_page/home_page.dart';
import 'package:flutter/material.dart';

import '../../../api/responses.dart';
import '../../../models/api_models.dart';

class CategoryProductScreen extends StatefulWidget {
  final String name;
  final int id;
  const CategoryProductScreen({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  List<Products>? productList;
  @override
  void initState() {
    getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(widget.name),
      ),
      body: productList == null
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductList(
                productList: productList,
                context: context,
              ),
            ),
    );
  }

  void getAllProducts() {
    OnlineModel.getProductsByCat(
      catId: widget.id,
      success: (List<Products> data) {
        setState(() {
          productList = data.reversed.toList();
        });
      },
      fail: (msg) {},
    );
  }
}
