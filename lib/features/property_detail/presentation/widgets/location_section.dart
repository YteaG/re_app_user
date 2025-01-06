import 'package:flutter/material.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import '../../styles/detail_styles.dart';
// Import your map package here (e.g., google_maps_flutter)

class LocationSection extends StatelessWidget {
  final Property property;

  const LocationSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Location', style: DetailStyles.sectionTitleStyle),
          const SizedBox(height: 8),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // Add your map widget here
                  const Center(
                    child: Text('Map will be displayed here'),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        // Implement navigation to maps
                      },
                      child: const Icon(Icons.directions),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
