class SliderResponse {
  List<Sliders>? sliders;
  bool? error;
  String? message;

  SliderResponse({this.sliders, this.error, this.message});

  SliderResponse.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(Sliders.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sliders != null) {
      data['sliders'] = sliders!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}

class Sliders {
  int? id;
  int? type;
  String? image;
  String? desc;
  int? relatedId;

  Sliders({this.id, this.type, this.image, this.desc, this.relatedId});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    desc = json['desc'];
    relatedId = json['related_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['image'] = image;
    data['desc'] = desc;
    data['related_id'] = relatedId;
    return data;
  }
}

class CategoryResponse {
  List<Categories>? categories;
  bool? error;
  String? message;

  CategoryResponse({this.categories, this.error, this.message});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? categoryImage;

  Categories({this.id, this.name, this.categoryImage});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_image'] = categoryImage;
    return data;
  }
}
