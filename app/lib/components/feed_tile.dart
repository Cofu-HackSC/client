import 'package:app/components/themed_text.dart';
import 'package:flutter/material.dart';

class FeedTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Image.asset(
                'assets/example_img.jpg',
                fit: BoxFit.cover,
                height: 142,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ThemedText(
                      'Homemade Pretzels',
                      type: Type.h2,
                    ),
                    ThemedText(
                      '\$1.50',
                      type: Type.subtitle,
                    ),
                  ],
                ),
              ),
              Divider(),
              ThemedText('Delivery and Pickup')
            ],
          ),
        ),
      ),
    );
  }
}
