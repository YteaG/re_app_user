import 'package:rm_app/features/home/presentation/widgets/featured_properties_widget.dart';

class Property {
  final String id;
  final String title;
  final String location;
  final String imageUrl;
  final double price;

  Property({
    required this.id,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.price,
  });
}
