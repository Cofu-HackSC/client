import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/models/item.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final Item item;
  final bool pickup;
  OrderPage(this.item, {this.pickup = true});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity;

  void initState() {
    quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        Header(
          'Order ${widget.pickup ? 'pickup' : 'delivery'}',
          showBack: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ThemedText(
            widget.item.name,
            type: Type.h1,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ThemedText('Order Quantity'),
              Row(children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () => setState(() => quantity--),
                ),
                ThemedText(quantity.toString()),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () => setState(() => quantity--),
                ),
              ]),
            ],
          )
        ]))
      ],
    ));
  }
}
