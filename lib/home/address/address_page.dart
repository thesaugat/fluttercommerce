import 'package:ecom/api/responses.dart';
import 'package:ecom/home/address/add_address.dart';
import 'package:ecom/models/api_models.dart';
import 'package:ecom/utils/DataHolder.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<Adresses>? addressList;

  @override
  void initState() {
    super.initState();
    getAddress();
  }

  @override
  Widget build(BuildContext context) {
    if (addressList == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: ElevatedButton.icon(
                onPressed: () {
                  addAddress();
                },
                icon: const Icon(
                  Icons.location_city_rounded,
                ),
                label: const Text("Add Address")),
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: addressList!.length,
                itemBuilder: (c, i) {
                  return ListTile(
                    leading: const Icon(
                      Icons.location_city_rounded,
                      size: 40,
                    ),
                    onTap: () {
                      Navigator.pop(context, addressList![i]);
                    },
                    title: Text(addressList![i].city!),
                    subtitle: Text(
                        "${addressList![i].description!} | ${addressList![i].province!} | ${addressList![i].street!}"),
                  );
                }),
          ),
        ],
      );
    }
  }

  void getAddress() {
    OnlineModel.getAddress(
        apiKey: DataHolder.loginResponse?.apiKey,
        success: (List<Adresses> response) {
          setState(() {
            addressList = response;
          });
        },
        fail: (msg) {});
  }

  void addAddress() {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          const AlertDialog(title: Text('Add Address'), content: AddAddress()),
    ).then((value) {
      if (value) {
        setState(() {
          addressList = null;
        });
        getAddress();
      }
    });
  }
}
