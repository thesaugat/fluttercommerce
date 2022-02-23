import 'dart:ui';

import 'package:ecom/utils/constants.dart';
import 'package:ecom/utils/user_interface_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: kInputColor, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              Text(
                "  Search For Products",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        elevation: 1,
      ),
      body: const FruitList(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final url = [
    "https://ecommerce.saugatimilsina.com.np/public/slider_images/2021/12/0244371.jpeg",
    "https://ecommerce.saugatimilsina.com.np/public/slider_images/2021/12/1022562.jpeg",
    "https://ecommerce.saugatimilsina.com.np/public/slider_images/2021/12/1023493.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox(
            height: 170,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                "https://ecommerce.saugatimilsina.com.np/public/slider_images/2021/12/1023493.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FruitList extends StatelessWidget {
  const FruitList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ["Mango", "Banana", "Apple", "Cucumber", "Grapes"];
    final url = [
      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Carabao_mangoes_%28Philippines%29.jpg/440px-Carabao_mangoes_%28Philippines%29.jpg",
      "https://cdn1.sph.harvard.edu/wp-content/uploads/sites/30/2018/08/bananas-1354785_1920.jpg",
      "https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png",
      "https://static.libertyprim.com/files/familles/concombre-large.jpg",
      "https://monsabsmarketplace.com/wp-content/uploads/2020/12/Grapes.jpg"
    ];
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: data.length,
        itemBuilder: (_, i) {
          return ListTile(
            onTap: () {
              UserInterfaceUtils.showSnackBar("${data[i]} Clicked", context);
            },
            title: Text(data[i]),
            trailing: SizedBox(
              height: 50,
              width: 50,
              child: Image.network(
                url[i],
                fit: BoxFit.fill,
              ),
            ),
          );
        });
  }
}
