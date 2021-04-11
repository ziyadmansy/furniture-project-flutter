import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/cartScreen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: null,
    );
  }
}