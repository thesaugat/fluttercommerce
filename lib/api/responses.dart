// ignore_for_file: unnecessary_this, unnecessary_new

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

class LoginResponse {
  bool? error;
  String? name;
  String? email;
  String? apiKey;
  String? createdAt;
  String? message;
  bool? isStaff;

  LoginResponse(
      {this.error,
      this.name,
      this.email,
      this.apiKey,
      this.createdAt,
      this.message,
      this.isStaff});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    email = json['email'];
    apiKey = json['apiKey'];
    createdAt = json['createdAt'];
    message = json['message'];
    isStaff = json['is_staff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['name'] = name;
    data['email'] = email;
    data['apiKey'] = apiKey;
    data['createdAt'] = createdAt;
    data['message'] = message;
    data['is_staff'] = isStaff;
    return data;
  }
}

class ProductListResponse {
  List<Products>? products;
  bool? error;
  String? message;

  ProductListResponse({this.products, this.error, this.message});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}

class Products {
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  String? description;
  int? quantity;
  int? cart_id;
  int? cart_quantity;
  String? productionDate;
  String? expireDate;
  List<String>? images;
  List<int>? categories;

  Products(
      {this.id,
      this.name,
      this.price,
      this.discountPrice,
      this.description,
      this.quantity,
      this.cart_quantity,
      this.cart_id,
      this.productionDate,
      this.expireDate,
      this.images,
      this.categories});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    quantity = json['quantity'];
    cart_id = json['cart_id'];
    cart_quantity = json['cart_quantity'];
    productionDate = json['production_date'];
    expireDate = json['expire_date'];
    images = json['images'].cast<String>();
    categories = json['categories'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['description'] = description;
    data['quantity'] = quantity;
    data['cart_id'] = cart_id;
    data['cart_quantity'] = cart_quantity;
    data['production_date'] = productionDate;
    data['expire_date'] = expireDate;
    data['images'] = images;
    data['categories'] = categories;
    return data;
  }
}

class AddressResponse {
  List<Adresses>? adresses;
  bool? error;
  String? message;

  AddressResponse({this.adresses, this.error, this.message});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    if (json['adresses'] != null) {
      adresses = <Adresses>[];
      json['adresses'].forEach((v) {
        adresses!.add(new Adresses.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.adresses != null) {
      data['adresses'] = this.adresses!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Adresses {
  int? id;
  String? city;
  String? street;
  String? description;
  String? province;

  Adresses({this.id, this.city, this.street, this.description, this.province});

  Adresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    street = json['street'];
    description = json['description'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['city'] = this.city;
    data['street'] = this.street;
    data['description'] = this.description;
    data['province'] = this.province;
    return data;
  }
}

class OrderHistoryResponse {
  List<OrderHistory>? orderHistory;
  bool? error;
  String? message;

  OrderHistoryResponse({this.orderHistory, this.error, this.message});

  OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['order_history'] != null) {
      orderHistory = <OrderHistory>[];
      json['order_history'].forEach((v) {
        orderHistory!.add(new OrderHistory.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.orderHistory != null) {
      data['order_history'] =
          this.orderHistory!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class OrderHistory {
  int? id;
  String? orderDateTime;
  int? paymentType;
  String? paymentRefrence;
  List<Bag>? bag;

  OrderHistory(
      {this.id,
      this.orderDateTime,
      this.paymentType,
      this.paymentRefrence,
      this.bag});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDateTime = json['order_date_time'];
    paymentType = json['payment_type'];
    paymentRefrence = json['payment_refrence'];
    if (json['bag'] != null) {
      bag = <Bag>[];
      json['bag'].forEach((v) {
        bag!.add(new Bag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['order_date_time'] = this.orderDateTime;
    data['payment_type'] = this.paymentType;
    data['payment_refrence'] = this.paymentRefrence;
    if (this.bag != null) {
      data['bag'] = this.bag!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bag {
  int? id;
  int? productId;
  int? unitPrice;
  int? quantity;
  Products? product;

  Bag({this.id, this.productId, this.unitPrice, this.quantity, this.product});

  Bag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    unitPrice = json['unit_price'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? new Products.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['unit_price'] = this.unitPrice;
    data['quantity'] = this.quantity;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
