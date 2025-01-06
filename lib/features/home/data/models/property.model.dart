class Property {
  final String id;
  final String title;
  final String description;
  final String location;
  final double price;
  final String imageUrl;      // Single image URL for list/grid views
  final List<String> images;  // Multiple images for detail view
  final String? virtualTourUrl;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final String propertyType;
  final String status;
  final List<String> amenities;
  final Agent agent;
  final bool isFeatured;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.imageUrl,    // Add this
    required this.images,
    this.virtualTourUrl,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.propertyType,
   this.status = 'For Sale',
    required this.amenities,
    required this.agent,
    this.isFeatured = false,
  });

  // You might want to add a factory constructor to create a Property from JSON
  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      price: json['price'] as double,
      imageUrl: json['imageUrl'] as String,
      images: List<String>.from(json['images'] as List),
      virtualTourUrl: json['virtualTourUrl'] as String?,
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
      area: json['area'] as double,
      propertyType: json['propertyType'] as String,
      status: json['status'] as String,
      amenities: List<String>.from(json['amenities'] as List),
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      isFeatured: json['isFeatured'] as bool? ?? false,
    );
  }

  // You might also want to add a toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'imageUrl': imageUrl,
      'images': images,
      'virtualTourUrl': virtualTourUrl,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'propertyType': propertyType,
      'status': status,
      'amenities': amenities,
      'agent': agent.toJson(),
      'isFeatured': isFeatured,
    };
  }
}

// Also define the Agent class if you haven't already
class Agent {
  final String id;
  final String name;
  final String agency;
  final String imageUrl;
  final String phone;
  final String email;

  Agent({
    required this.id,
    required this.name,
    required this.agency,
    required this.imageUrl,
    required this.phone,
    required this.email,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      id: json['id'] as String,
      name: json['name'] as String,
      agency: json['agency'] as String,
      imageUrl: json['imageUrl'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'agency': agency,
      'imageUrl': imageUrl,
      'phone': phone,
      'email': email,
    };
  }
}
