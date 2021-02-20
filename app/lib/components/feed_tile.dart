import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:flutter/material.dart';

class FeedTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Card(
        color: AppTheme.backgroundLighGray,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
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
                      'Homemade Pretzels',
                      type: Type.h2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ThemedText(
                          'Delivery and Pickup',
                          type: Type.subtitle,
                        ),
                        Stars(4.2),
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

class Stars extends StatelessWidget {
  final double stars;
  Stars(this.stars);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ThemedText(
          stars.toString(),
          type: Type.subtitle,
        ),
        Icon(
          Icons.star_rounded,
          size: 16,
          color: AppTheme.star,
        ),
      ],
    );
  }
}
