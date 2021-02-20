import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/models/item.dart';
import 'package:app/pages/item_info.dart';
import 'package:flutter/material.dart';

class FeedTile extends StatelessWidget {
  final Item item;
  FeedTile(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (c) => ItemInfoPage(item))),
        style: TextButton.styleFrom(
            backgroundColor: AppTheme.backgroundLighGray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.zero),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/example_img.jpg',
                fit: BoxFit.cover,
                height: 180,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemedText(
                      item.name,
                      type: Type.h2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ThemedText(
                          '${item.delivery ? item.pickup ? 'Delivery and Pickup' : 'Delivery' : item.pickup ? 'Pickup' : 'Error'}',
                          type: Type.subtitle,
                        ),
                        Row(
                          children: [
                            ThemedText(
                              item.avgItemRating.toString(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
