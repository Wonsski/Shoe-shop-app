import 'package:flutter/material.dart';
import 'package:sample_shop/Items/ItemCard.dart';
import 'dart:async';

class Shoes{
  String url;
  String name;
  String price;
  String category;

  Shoes({this.url, this.name, this.price, this.category});
}

class Debouncer{
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action){
    if(null != _timer){
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds),action);
  }
}

Widget getItems(List<Shoes> shoes){
    List<Widget> list = new List<Widget>();
    for(var i = 0; i < shoes.length; i++){
        list.add(new ItemCard(name: shoes[i].name, price: shoes[i].price, url: shoes[i].url));
    }
    return ListView(scrollDirection: Axis.vertical, children: list);
}