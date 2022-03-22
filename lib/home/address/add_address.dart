import 'package:ecom/models/api_models.dart';
import 'package:ecom/utils/DataHolder.dart';
import 'package:ecom/utils/user_interface_utils.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  String? city, province, street, desc;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: CircularProgressIndicator()));
    }
    return Column(mainAxisSize: MainAxisSize.min, children: [
      TextField(
        decoration: const InputDecoration(hintText: "City"),
        onChanged: (val) {
          city = val;
        },
      ),
      TextField(
        decoration: const InputDecoration(hintText: "Street"),
        onChanged: (val) {
          street = val;
        },
      ),
      TextField(
        decoration: const InputDecoration(hintText: "Province"),
        onChanged: (val) {
          province = val;
        },
      ),
      TextField(
        decoration: const InputDecoration(hintText: "Description"),
        maxLines: 4,
        onChanged: (val) {
          desc = val;
        },
      ),
      const SizedBox(height: 10),
      ElevatedButton.icon(
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            OnlineModel.addAddress(
                apiKey: DataHolder.loginResponse!.apiKey!,
                city: city,
                street: street,
                province: province,
                desc: desc,
                success: (msg) {
                  Navigator.pop(context, true);
                  UserInterfaceUtils.showSnackBar("Address Added", context);
                },
                fail: (msg) {
                  setState(() {
                    isLoading = false;
                  });
                });
          },
          icon: const Icon(Icons.add),
          label: const Text("Add "))
    ]);
  }
}
