// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.entityName,
    this.instanceName,
    this.id,
    this.createdDate,
    this.createdBy,
    this.lastModifiedDate,
    this.version,
    this.productName,
  });

  String? entityName;
  String? instanceName;
  String?  id;
  DateTime? createdDate;
  String?  createdBy;
  DateTime? lastModifiedDate;
  int? version;
  String?  productName;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    entityName: json["_entityName"] == null ? null : json["_entityName"],
    instanceName: json["_instanceName"] == null ? null : json["_instanceName"],
    id: json["id"] == null ? null : json["id"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    lastModifiedDate: json["lastModifiedDate"] == null ? null : DateTime.parse(json["lastModifiedDate"]),
    version: json["version"] == null ? null : json["version"],
    productName: json["productName"] == null ? null : json["productName"],
  );

  Map<String, dynamic> toJson() => {
    "_entityName": entityName == null ? null : entityName,
    "_instanceName": instanceName == null ? null : instanceName,
    "id": id == null ? null : id,
    "createdDate": createdDate == null ? null : createdDate?.toIso8601String(),
    "createdBy": createdBy == null ? null : createdBy,
    "lastModifiedDate": lastModifiedDate == null ? null : lastModifiedDate?.toIso8601String(),
    "version": version == null ? null : version,
    "productName": productName == null ? null : productName,
  };
}
