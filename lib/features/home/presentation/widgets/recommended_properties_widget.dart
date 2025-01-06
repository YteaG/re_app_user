import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import 'package:rm_app/features/property_detail/presentation/screens/property.detail.page.dart';
import '../styles/home_styles.dart';

class RecommendedPropertiesWidget extends StatelessWidget {
  final List<Property> properties;

  const RecommendedPropertiesWidget({
    super.key,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Recommended Properties', style: HomeStyles.titleStyle),
            );
          }
          return _buildRecommendedPropertyCard(context, properties[index - 1]);
        },
        childCount: properties.length + 1,
      ),
    );
  }

  Widget _buildRecommendedPropertyCard(BuildContext context, Property property) {
    return GestureDetector(
      onTap: () => _navigateToPropertyDetail(context, property),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 3,
          child: Container(
            height: 120,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: property.imageUrl,
                    width: 100,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        property.title,
                        style: HomeStyles.propertyTitleStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              property.location,
                              style: HomeStyles.locationStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${property.price.toStringAsFixed(0)}',
                            style: HomeStyles.priceStyle,
                          ),
                          Row(
                            children: [
                              _buildFeatureIcon(Icons.bed, '${property.bedrooms}'),
                              const SizedBox(width: 8),
                              _buildFeatureIcon(
                                  Icons.bathroom, '${property.bathrooms}'),
                              const SizedBox(width: 8),
                              _buildFeatureIcon(
                                  Icons.square_foot, '${property.area}m²'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPropertyDetail(BuildContext context, Property property) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PropertyDetailPage(property: property),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: HomeStyles.locationStyle.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
