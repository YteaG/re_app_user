import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rm_app/features/properties/data/repositories/property.repository.dart';
import 'package:rm_app/features/properties/presentation/bloc/property.event.dart';
import 'package:rm_app/features/properties/presentation/bloc/property.state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyRepository repository;

  PropertyBloc(this.repository) : super(PropertyInitial()) {
    on<FetchProperties>((event, emit) async {
      emit(PropertyLoading());
      try {
        final featured = await repository.fetchFeaturedProperties();
        final recommended = await repository.fetchRecommendedProperties();
        emit(PropertyLoaded(
          featuredProperties: featured,
          recommendedProperties: recommended,
        ));
      } catch (e) {
        emit(PropertyError('Failed to load properties'));
      }
    });
  }
}
