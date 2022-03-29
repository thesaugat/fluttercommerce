import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecom/api/responses.dart';
import 'package:ecom/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OnlineModel {
  static getSliders({success, fail}) {
    http.get(Uri.parse("$baseUrl/slider")).then((http.Response response) {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        success(SliderResponse.fromJson(json).sliders);
      } else {
        fail(response.reasonPhrase);
      }
    });
  }

  static getCategories({success, fail}) {
    http
        .get(Uri.parse("$baseUrl/get-categories"))
        .then((http.Response response) {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        success(CategoryResponse.fromJson(json).categories);
      } else {
        fail(response.reasonPhrase);
      }
    });
  }

  static getAllProducts({success, fail}) {
    http
        .get(Uri.parse("$baseUrl/get-all-products"))
        .then((http.Response response) {
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        success(ProductListResponse.fromJson(json).products);
      } else {
        fail(response.reasonPhrase);
      }
    });
  }

  static getProductsByCat({catId, success, fail}) {
    http
        .get(Uri.parse("$baseUrl/get-products-by-category?c_id=$catId"))
        .then((http.Response response) {
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        debugPrint(json.toString());
        success(ProductListResponse.fromJson(json).products);
      } else {
        fail(response.reasonPhrase);
      }
    });
  }

  static login({
    required email,
    required password,
    required success,
    required fail,
  }) {
    http.post(Uri.parse("$baseUrl/login"), body: {
      "email": email,
      "password": password
    }).then((http.Response response) {
      if (response.statusCode == 200) {
        var j = jsonDecode(response.body);
        LoginResponse loginResponse = LoginResponse.fromJson(j);
        if (!loginResponse.error!) {
          SharedPreferences.getInstance().then((value) {
            value.setString(Keys.LOGIN_RESPONSE_KEY, json.encode(j));
            value.setBool(Keys.IS_LOGGED_KEY, true);
          });
          success(loginResponse);
        } else {
          fail(loginResponse.message);
        }
      } else {
        fail(response.reasonPhrase);
      }
    });
  }

  static register({
    required email,
    required password,
    required name,
    required success,
    required fail,
  }) {
    http.post(Uri.parse("$baseUrl/register"), body: {
      "name": name,
      "email": email,
      "password": password
    }).then((http.Response response) {
      if (response.statusCode == 201) {
        var json = jsonDecode(response.body);
        LoginResponse loginResponse = LoginResponse.fromJson(json);
        if (!loginResponse.error!) {
          success(loginResponse);
        } else {
          fail(loginResponse.message);
        }
      } else {
        fail(response.reasonPhrase);
      }
    });
  }

  static addToCart(
      {required apiKey,
      required int pid,
      required int quanity,
      required success,
      required fail}) {
    var formData = FormData.fromMap({
      "p_id": pid,
      "quantity": quanity,
    });

    Dio()
        .post(
      "$baseUrl/cart",
      data: formData,
      options: Options(
        headers: {
          "token": apiKey,
        },
      ),
    )
        .then((response) {
      debugPrint("hello");
      debugPrint(response.data.toString());
      debugPrint(response.toString());
      debugPrint(apiKey);
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        if (!loginResponse.error!) {
          success(loginResponse.message);
        } else {
          fail(loginResponse.message);
        }
      } else {
        fail(response.statusMessage);
      }
    });
  }

  static getCart({required apiKey, required success, required fail}) {
    http.get(
      Uri.parse("$baseUrl/cart"),
      headers: {'token': apiKey},
    ).then((http.Response response) {
      debugPrint(response.body.toString());
      if (response.statusCode == 200) {
        debugPrint(response.body.toString());
        var json = jsonDecode(response.body);
        success(ProductListResponse.fromJson(json).products);
      } else {
        fail(response.reasonPhrase);
      }
    });
  }

  static removeFromCart(
      {required apiKey, required int cid, required success, required fail}) {
    Dio()
        .delete(
      "$baseUrl/cart",
      queryParameters: {
        "c_id": cid,
      },
      options: Options(
        headers: {
          "token": apiKey, // set content-length
        },
      ),
    )
        .then((response) {
      debugPrint("${response.statusCode}");
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        if (!loginResponse.error!) {
          success(loginResponse.message);
        } else {
          fail(loginResponse.message);
        }
      } else {
        fail(response.statusMessage);
      }
    });
  }

  static getAddress({required apiKey, required success, required fail}) {
    http.get(
      Uri.parse("$baseUrl/address"),
      headers: {'Apikey': apiKey},
    ).then((http.Response response) {
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        debugPrint(response.body.toString());
        var json = jsonDecode(response.body);
        success(AddressResponse.fromJson(json).adresses);
      } else {
        fail(response.reasonPhrase);
      }
    });
  }

  static addAddress({
    required apiKey,
    required city,
    required street,
    required province,
    required desc,
    required success,
    required fail,
  }) {
    // var formData = FormData.fromMap({
    //   "city": city,
    //   "province": province,
    //   "description": desc,
    //   "street": street,
    // });
    http.post(
      Uri.parse("$baseUrl/address"),
      body: {
        "city": city,
        "province": province,
        "description": desc,
        "street": street,
      },
      headers: {'Apikey': apiKey},
    ).then((http.Response response) {
      debugPrint(response.toString());
      debugPrint("${response.statusCode}");
      if (response.statusCode == 201) {
        success("Success");
      } else {
        fail(response.reasonPhrase);
      }
    });
  }

  static order(
      {required apiKey,
      required int addressId,
      required int ptype,
      required String paymentRefrence,
      required success,
      required fail}) {
    var formData = FormData.fromMap(
      {
        "p_type": ptype,
        "payment_refrence": paymentRefrence,
        "address_id": addressId,
      },
    );
    Dio()
        .post(
      "$baseUrl/order",
      data: formData,
      options: Options(
        headers: {
          "token": apiKey, // set content-length
        },
      ),
    )
        .then((response) {
      debugPrint("${response.statusCode}");
      debugPrint(response.toString());
      if (response.statusCode == 201) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        if (!loginResponse.error!) {
          success("Order Success");
        } else {
          fail(loginResponse.message);
        }
      } else {
        fail(response.statusMessage);
      }
    });
  }

  static orderHistory({required apiKey, required success, required fail}) {
    Dio()
        .get(
      "$baseUrl/order",
      options: Options(
        headers: {
          "token": apiKey, // set content-length
        },
      ),
    )
        .then((response) {
      debugPrint("${response.statusCode}");
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        OrderHistoryResponse orderHistoryResponse =
            OrderHistoryResponse.fromJson(response.data);
        if (!orderHistoryResponse.error!) {
          success(orderHistoryResponse);
        } else {
          fail(orderHistoryResponse.message);
        }
      } else {
        fail(response.statusMessage);
      }
    });
  }
}
