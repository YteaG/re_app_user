import 'package:equatable/equatable.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';

abstract class PropertyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PropertyInitial extends PropertyState {}

class PropertyLoading extends PropertyState {}

class PropertyLoaded extends PropertyState {
  final List<Property> featuredProperties;
  final List<Property> recommendedProperties;

  PropertyLoaded({
    required this.featuredProperties,
    required this.recommendedProperties,
  });

  @override
  List<Object?> get props => [featuredProperties, recommendedProperties];
}

class PropertyError extends PropertyState {
  final String message;

  PropertyError(this.message);

  @override
  List<Object?> get props => [message];
}
