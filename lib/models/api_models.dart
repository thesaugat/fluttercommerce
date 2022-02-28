import 'dart:convert';

import 'package:ecom/api/responses.dart';
import 'package:ecom/utils/constants.dart';
import 'package:http/http.dart' as http;

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
}
