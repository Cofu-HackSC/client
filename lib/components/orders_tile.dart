import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/models/cook_profile.dart';
import 'package:app/models/item.dart';
import 'package:app/models/sale.dart';
import 'package:app/pages/item_info.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final Sale sale;
  OrderTile({@required this.sale});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (c) => ItemInfoPage(
              item: sale.item,
            ),
          ),
        ),
        style: TextButton.styleFrom(
            backgroundColor: AppTheme.backgroundLighGray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.zero),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    child: Image.asset(
                      'assets/example_img.jpg',
                      fit: BoxFit.cover,
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                    ),
                    tag: sale.item.itemID,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ThemedText(
                                  sale.item.name,
                                  type: Type.h2,
                                ),
                                ThemedText(
                                  '${sale.pickup ? 'Pickup' : 'Delivery'}',
                                  type: Type.subtitle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ThemedText(
                                  '${sale.amount} x \$' +
                                      sale.item.cost.toStringAsFixed(2),
                                  // type: Type.subtitle,
                                ),
                                Row(
                                  children: [
                                    ThemedText(
                                      sale.item.avgItemRating.toString(),
                                      type: Type.subtitle,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      size: 16,
                                      color: AppTheme.star,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              if (sale.fulfilled)
                Positioned(
                  right: 8,
                  child: FloatingActionButton(
                    mini: true,
                    child: Icon(Icons.check),
                    onPressed: () {},
                    backgroundColor: Colors.green[600],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
