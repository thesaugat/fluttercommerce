import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/models/api_models.dart';
import 'package:ecom/utils/constants.dart';
import 'package:ecom/utils/user_interface_utils.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../api/responses.dart';

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
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final url = [];
  late List<Sliders> sliders;
  List<Categories>? categories;

  @override
  void initState() {
    getSlider();
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (url.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              ),
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
                            fit: BoxFit.fill,
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              GestureDetector(
                  child: const Text(
                "SHOP MORE >",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor),
              ))
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          if (categories != null)
            Container(
              height: 230,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10)),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories!.length > 8 ? 8 : categories!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 4
                        : 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: (4 / 5),
                  ),
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: CachedNetworkImage(
                                imageUrl: categories![i].categoryImage!),
                          ),
                          Text(
                            "#${categories![i].name!}",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "Just For You",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  void getSlider() {
    OnlineModel.getSliders(
      success: (List<Sliders> data) {
        setState(() {
          sliders = data;
          for (var element in data) {
            url.add(element.image);
          }
        });
      },
      fail: (msg) {},
    );
  }

  void getCategories() {
    OnlineModel.getCategories(
      success: (List<Categories> data) {
        setState(() {
          categories = data.reversed.toList();
        });
      },
      fail: (msg) {},
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
