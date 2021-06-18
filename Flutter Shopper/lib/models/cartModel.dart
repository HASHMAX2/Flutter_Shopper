import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog.dart';
import 'data.dart';

class CartModel {
  final List<int> itemIds = [];

  List datalist = data.items.toList();
  num totalPirce = data.items.fold(0, (total, current) => total + current.price);

  void add(Catalog x) {
    itemIds.add(x.id);
  }
}
