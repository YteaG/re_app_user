import 'package:rm_app/features/home/data/models/property.model.dart';

class PropertyRepository {
  Future<List<Property>> fetchFeaturedProperties() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return List.generate(
      5,
      (index) => Property(
        id: '${index + 1}',
        title: 'Modern Apartment ${index + 1}',
        description: 'Beautiful modern apartment in the city center with stunning views and premium finishes. '
            'This property features open-concept living spaces, high-end appliances, and luxurious details throughout.',
        location: 'Downtown, New York',
        price: 450000 + (index * 50000),
        imageUrl: 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=500',
        images: [
          'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=500',
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=500',
          'https://images.unsplash.com/photo-1516455590571-18256e5bb9ff?w=500',
        ],
        virtualTourUrl: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        bedrooms: 2,
        bathrooms: 2,
        area: 85.0,
        propertyType: 'Apartment',
        status: 'For Sale',
        amenities: [
          'Parking',
          'WiFi',
          'Pool',
          'Gym',
          'Security',
          'Air Conditioning',
        ],
        agent: Agent(
          id: 'A001',
          name: 'John Doe',
          agency: 'Premium Real Estate',
          imageUrl: 'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=500',
          phone: '+1 (555) 123-4567',
          email: 'john.doe@realestate.com',
        ),
        isFeatured: true,
      ),
    );
  }

  Future<List<Property>> fetchRecommendedProperties() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return List.generate(
      5,
      (index) => Property(
        id: '${index + 6}',
        title: 'Luxury Villa ${index + 1}',
        description: 'Spacious villa with ocean view and premium amenities. '
            'Features include a private pool, garden, and state-of-the-art smart home technology.',
        location: 'Miami Beach, Florida',
        price: 1200000 + (index * 100000),
        imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=500',
        images: [
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=500',
          'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=500',
          'https://images.unsplash.com/photo-1516455590571-18256e5bb9ff?w=500',
        ],
        virtualTourUrl: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        bedrooms: 4,
        bathrooms: 3,
        area: 250.0,
        propertyType: 'Villa',
        status: 'For Sale',
        amenities: [
          'Private Pool',
          'Garden',
          'Smart Home',
          'Security System',
          'Ocean View',
          'Garage',
          'Wine Cellar',
        ],
        agent: Agent(
          id: 'A002',
          name: 'Jane Smith',
          agency: 'Luxury Homes',
          imageUrl: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=500',
          phone: '+1 (555) 987-6543',
          email: 'jane.smith@luxuryhomes.com',
        ),
        isFeatured: true,
      ),
    );
  }
}
