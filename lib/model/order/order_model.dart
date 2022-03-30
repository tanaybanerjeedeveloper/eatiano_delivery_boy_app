// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    required this.status,
    required this.data,
  });

  final String status;
  final List<Datum> data;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.orderId,
    required this.orderUniqueId,
    required this.restaurantImage,
    required this.restaurantName,
    required this.restaurantRatingCount,
    required this.status,
    required this.transactionAmount,
  });

  final int orderId;
  final String orderUniqueId;
  final RestaurantImage? restaurantImage;
  final RestaurantName? restaurantName;
  final String restaurantRatingCount;
  final Status? status;
  final String transactionAmount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["order_id"],
        orderUniqueId: json["order_unique_id"],
        restaurantImage: restaurantImageValues.map[json["restaurant_image"]],
        restaurantName: restaurantNameValues.map[json["restaurant_name"]],
        restaurantRatingCount: json["restaurant_rating_count"],
        status: statusValues.map[json["status"]],
        transactionAmount: json["transaction_amount"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_unique_id": orderUniqueId,
        "restaurant_image": restaurantImageValues.reverse![restaurantImage],
        "restaurant_name": restaurantNameValues.reverse![restaurantName],
        "restaurant_rating_count": restaurantRatingCount,
        "status": statusValues.reverse![status],
        "transaction_amount": transactionAmount,
      };
}

enum RestaurantImage { PUBLIC_ASSETS_RESTAURANT_6_X4_A_JL03_3630_JPG }

final restaurantImageValues = EnumValues({
  "/public/assets/restaurant/6x4aJL03-36-30.jpg":
      RestaurantImage.PUBLIC_ASSETS_RESTAURANT_6_X4_A_JL03_3630_JPG
});

enum RestaurantName { CITY_CLUB }

final restaurantNameValues =
    EnumValues({"City Club": RestaurantName.CITY_CLUB});

enum Status { PICKUP, DELIVERED }

final statusValues =
    EnumValues({"delivered": Status.DELIVERED, "pickup": Status.PICKUP});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
