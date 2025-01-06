import 'package:flutter/material.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import '../../styles/detail_styles.dart';

class PropertyHeader extends StatelessWidget {
  final Property property;

  const PropertyHeader({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property.title,
            style: DetailStyles.titleStyle,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  property.location,
                  style: DetailStyles.locationStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '\$${property.price.toStringAsFixed(0)}',
            style: DetailStyles.priceStyle,
          ),
        ],
      ),
    );
  }
}
