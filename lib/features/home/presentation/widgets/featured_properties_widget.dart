import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import 'package:rm_app/features/property_detail/presentation/screens/property.detail.page.dart';
import 'package:shimmer/shimmer.dart';
import '../styles/home_styles.dart';

class FeaturedPropertiesWidget extends StatelessWidget {
  final List<Property> properties;

  const FeaturedPropertiesWidget({
    super.key,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Featured Properties', style: HomeStyles.titleStyle),
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: properties.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => _buildFeaturedPropertyCard(
                context,
                properties[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedPropertyCard(BuildContext context, Property property) {
    
    return GestureDetector(
      onTap: () => _navigateToPropertyDetail(context, property),
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: property.imageUrl,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(color: Colors.white),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Featured',
                              style: HomeStyles.locationStyle.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        const Icon(Icons.location_on,
                            size: 16, color: Colors.grey),
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
