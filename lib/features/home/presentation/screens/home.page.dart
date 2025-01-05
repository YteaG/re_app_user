import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import 'package:rm_app/features/properties/data/repositories/property.repository.dart';
import 'package:rm_app/features/properties/presentation/bloc/property.bloc.dart';
import 'package:rm_app/features/properties/presentation/bloc/property.event.dart';
import 'package:rm_app/features/properties/presentation/bloc/property.state.dart';


class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key});
  
  final PropertyRepository repository = PropertyRepository();

  @override
  
  Widget build(BuildContext context) {
    
    return BlocProvider(
     create: (context) => PropertyBloc(repository)..add(FetchProperties()),


      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.blueAccent,
        ),
        body: BlocBuilder<PropertyBloc, PropertyState>(
          builder: (context, state) {
            if (state is PropertyLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PropertyLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Featured Properties',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _buildFeaturedSection(state.featuredProperties),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Recommended Properties',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _buildRecommendedSection(state.recommendedProperties),
                  ],
                ),
              );
            } else if (state is PropertyError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            }
            return const Center(child: Text('Welcome to Real Estate App'));
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedSection(List<Property> properties) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      property.imageUrl,
                      width: 150,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      property.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('\$${property.price.toStringAsFixed(2)}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecommendedSection(List<Property> properties) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        final property = properties[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Card(
            elevation: 4,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  property.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(property.title),
              subtitle: Text(property.location),
              trailing: Text('\$${property.price.toStringAsFixed(2)}'),
            ),
          ),
        );
      },
    );
  }
}
