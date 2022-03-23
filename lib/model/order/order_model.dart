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
    required this.deliveryboyStatusId,
    required this.deliveryboyId,
    required this.orderUniqueId,
    required this.status,
    required this.orderId,
    required this.userId,
    required this.restaurantId,
    required this.transactionId,
    required this.totalAmount,
    required this.buyingPrice,
    required this.transactionAmount,
    required this.marchentName,
    required this.discountAmount,
    required this.deliveryCharge,
    required this.orderStatus,
    required this.deliveryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  final int deliveryboyStatusId;
  final int deliveryboyId;
  final String orderUniqueId;
  final Status? status;
  final int orderId;
  final String userId;
  final String restaurantId;
  final String transactionId;
  final String totalAmount;
  final String buyingPrice;
  final String transactionAmount;
  final MarchentName? marchentName;
  final String discountAmount;
  final String deliveryCharge;
  final OrderStatus? orderStatus;
  final String deliveryDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        deliveryboyStatusId: json["deliveryboy_status_id"],
        deliveryboyId: json["deliveryboy_id"],
        orderUniqueId: json["order_unique_id"],
        status: statusValues.map[json["status"]],
        orderId: json["order_id"],
        userId: json["user_id"],
        restaurantId: json["restaurant_id"],
        transactionId: json["transaction_id"],
        totalAmount: json["total_amount"],
        buyingPrice: json["buying_price"],
        transactionAmount: json["transaction_amount"],
        marchentName: marchentNameValues.map[json["marchent_name"]],
        discountAmount: json["discount_amount"],
        deliveryCharge: json["delivery_charge"],
        orderStatus: orderStatusValues.map[json["order_status"]],
        deliveryDate: json["delivery_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "deliveryboy_status_id": deliveryboyStatusId,
        "deliveryboy_id": deliveryboyId,
        "order_unique_id": orderUniqueId,
        "status": statusValues.reverse![status],
        "order_id": orderId,
        "user_id": userId,
        "restaurant_id": restaurantId,
        "transaction_id": transactionId,
        "total_amount": totalAmount,
        "buying_price": buyingPrice,
        "transaction_amount": transactionAmount,
        "marchent_name": marchentNameValues.reverse![marchentName],
        "discount_amount": discountAmount,
        "delivery_charge": deliveryCharge,
        "order_status": orderStatusValues.reverse![orderStatus],
        "delivery_date": deliveryDate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum MarchentName { ABC }

final marchentNameValues = EnumValues({"abc": MarchentName.ABC});

enum OrderStatus { PLACED }

final orderStatusValues = EnumValues({"Placed": OrderStatus.PLACED});

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
