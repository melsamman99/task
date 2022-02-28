class ProductsModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Data>? data;

  ProductsModel({this.status, this.errNum, this.msg, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    errNum = json["errNum"];
    msg = json["msg"];
    data = json["data"]==null ? null : (json["data"] as List).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["errNum"] = errNum;
    data["msg"] = msg;
    if(this.data != null) {
      data["data"] = this.data?.map((e)=>e.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? price;
  String? photo;
  int? offer;
  String? description;
  int? userId;
  int? catId;
  int? amount;
  String? colors;
  String? sizes;
  String? createdAt;
  String? updatedAt;
  Cat? cat;

  Data({this.id, this.name, this.price, this.photo, this.offer, this.description, this.userId, this.catId, this.amount, this.colors, this.sizes, this.createdAt, this.updatedAt, this.cat});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    photo = json["photo"];
    offer = json["offer"];
    description = json["description"];
    userId = json["user_id"];
    catId = json["cat_id"];
    amount = json["amount"];
    colors = json["colors"];
    sizes = json["sizes"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    cat = json["cat"] == null ? null : Cat.fromJson(json["cat"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["price"] = price;
    data["photo"] = photo;
    data["offer"] = offer;
    data["description"] = description;
    data["user_id"] = userId;
    data["cat_id"] = catId;
    data["amount"] = amount;
    data["colors"] = colors;
    data["sizes"] = sizes;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    if(cat != null) {
      data["cat"] = cat?.toJson();
    }
    return data;
  }
}

class Cat {
  int? id;
  String? name;
  int? userId;
  String? photo;
  String? createdAt;
  String? updatedAt;

  Cat({this.id, this.name, this.userId, this.photo, this.createdAt, this.updatedAt});

  Cat.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    userId = json["user_id"];
    photo = json["photo"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["user_id"] = userId;
    data["photo"] = photo;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}