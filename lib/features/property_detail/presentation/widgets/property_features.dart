import 'package:flutter/material.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import '../../styles/detail_styles.dart';

class PropertyFeatures extends StatelessWidget {
  final Property property;

  const PropertyFeatures({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFeatureItem(Icons.bed, '${property.bedrooms} Beds'),
          _buildFeatureItem(Icons.bathroom, '${property.bathrooms} Baths'),
          _buildFeatureItem(Icons.square_foot, '${property.area}m²'),
          _buildFeatureItem(Icons.house, property.propertyType),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 4),
        Text(text, style: DetailStyles.featureStyle),
      ],
    );
  }
}
