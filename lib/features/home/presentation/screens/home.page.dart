import 'package:flutter/material.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/categories_widget.dart';
import '../widgets/featured_properties_widget.dart';
import '../widgets/recommended_properties_widget.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(),
            CategoriesWidget(),
            SizedBox(height: 16),
            FeaturedPropertiesWidget(),
            SizedBox(height: 16),
            RecommendedPropertiesWidget(),
          ],
        ),
      ),
    );
  }
}
