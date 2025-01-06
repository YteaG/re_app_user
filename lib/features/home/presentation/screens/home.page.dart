import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rm_app/features/properties/data/repositories/property.repository.dart';
import 'package:rm_app/features/properties/presentation/bloc/property.bloc.dart';
import 'package:rm_app/features/properties/presentation/bloc/property.event.dart';
import 'package:rm_app/features/properties/presentation/bloc/property.state.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/featured_properties_widget.dart';
import '../widgets/recommended_properties_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key});
  
  final PropertyRepository repository = PropertyRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PropertyBloc(repository)..add(FetchProperties()),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: BlocBuilder<PropertyBloc, PropertyState>(
            builder: (context, state) {
              if (state is PropertyLoading) {
                return const LoadingWidget();
              } else if (state is PropertyLoaded) {
                return CustomScrollView(
                  slivers: [
                    const CustomSliverAppBar(),
                    const SearchBarWidget(),
                    FeaturedPropertiesWidget(
                      properties: state.featuredProperties,
                    ),
                    RecommendedPropertiesWidget(
                      properties: state.recommendedProperties,
                    ),
                  ],
                );
              } else if (state is PropertyError) {
                return ErrorDisplayWidget(
                  message: state.message,
                  onRetry: () {
                    context.read<PropertyBloc>().add(FetchProperties());
                  },
                );
              }
              return const Center(child: Text('Welcome to Real Estate App'));
            },
          ),
        ),
      ),
    );
  }
}
