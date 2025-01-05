import 'package:rm_app/features/home/data/models/property.model.dart';

class PropertyRepository {
  Future<List<Property>> fetchFeaturedProperties() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return List.generate(
      5,
      (index) => Property(
        id: 'prop_$index',
        title: 'Featured Property $index',
        location: 'Location $index',
        imageUrl: 'https://via.placeholder.com/150',
        price: (100000 + index * 5000).toDouble(),
      ),
    );
  }

  Future<List<Property>> fetchRecommendedProperties() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return List.generate(
      5,
      (index) => Property(
        id: 'rec_$index',
        title: 'Recommended Property $index',
        location: 'Location $index',
        imageUrl: 'https://via.placeholder.com/150',
        price: (90000 + index * 4000).toDouble(),
      ),
    );
  }
}
