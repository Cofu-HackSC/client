import 'package:app/components/header.dart';
import 'package:app/components/spaced_row.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/models/item.dart';
import 'package:flutter/material.dart';

import '../../components/button.dart';
import '../../components/themed_text.dart';

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
          SizedBox(
            height: 32,
          ),
          ThemedText(
            widget.item.name,
            type: Type.h1,
          ),
          ThemedText(
            widget.item.cook.address,
            type: Type.subtitle,
          ),
          SizedBox(
            height: 16,
          ),
          Divider(),
          SpacedRow(
            ThemedText('Order Quantity'),
            Row(children: [
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () => setState(() {
                  if (quantity > 1) quantity--;
                }),
              ),
              ThemedText(quantity.toString()),
              IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: () => setState(() {
                  if (quantity < widget.item.stock) quantity++;
                }),
              ),
            ]),
          ),
          Divider(),
          SpacedRow(ThemedText('Cost Per'),
              ThemedText('\$' + widget.item.cost.toStringAsFixed(2))),
          SpacedRow(
              ThemedText('Subtotal'),
              ThemedText(
                  '\$' + (quantity * widget.item.cost).toStringAsFixed(2))),
          // Might remove below
          SizedBox(height: 8),
          SpacedRow(
              ThemedText('Tax'),
              ThemedText('\$' +
                  (.0725 * quantity * widget.item.cost).toStringAsFixed(2))),
          if (!widget.pickup)
            SpacedRow(ThemedText('Delivery Fee'), ThemedText('\$1.00')),
          // Might remove above
          Divider(),
          SpacedRow(
              ThemedText(
                'Total Cost',
                type: Type.h2,
              ),
              ThemedText(
                '\$' +
                    (1.0725 * quantity * widget.item.cost + 1)
                        .toStringAsFixed(2),
                type: Type.h2,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
            child: Button(
              'Place Order',
              onPressed: () {
                // Place Order
              },
            ),
          ),
        ]))
      ],
    ));
  }
}
