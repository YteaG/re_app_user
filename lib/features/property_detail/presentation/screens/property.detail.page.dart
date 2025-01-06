import 'package:flutter/material.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import '../widgets/property_app_bar.dart';
import '../widgets/property_image_gallery.dart';
import '../widgets/property_header.dart';
import '../widgets/property_features.dart';
import '../widgets/property_description.dart';
import '../widgets/virtual_tour_section.dart';
import '../widgets/location_section.dart';
import '../widgets/agent_section.dart';
import '../widgets/bottom_actions.dart';

class PropertyDetailPage extends StatefulWidget {
  final Property property;

  const PropertyDetailPage({
    super.key,
    required this.property,
  });

  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 200 && !_showTitle) {
      setState(() => _showTitle = true);
    } else if (_scrollController.offset <= 200 && _showTitle) {
      setState(() => _showTitle = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              PropertyAppBar(
                key: const ValueKey('property_app_bar'),
                showTitle: _showTitle,
                title: widget.property.title,
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PropertyImageGallery(
                        key: const ValueKey('property_image_gallery'),
                        property: widget.property),
                    PropertyHeader(
                        key: const ValueKey('property_header'),
                        property: widget.property),
                    PropertyFeatures(
                        key: const ValueKey('property_features'),
                        property: widget.property),
                    PropertyDescription(
                        key: const ValueKey('property_description'),
                        property: widget.property),
                    if (widget.property.virtualTourUrl != null)
                      VirtualTourSection(
                          key: const ValueKey('virtual_tour_section'),
                          property: widget.property),
                    LocationSection(
                        key: const ValueKey('location_section'),
                        property: widget.property),
                    AgentSection(
                        key: const ValueKey('agent_avatar'),
                        agent: widget.property.agent),
                    // Add some bottom padding for the bottom actions
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
          // Floating action buttons for quick actions
          Positioned(
            right: 16,
            bottom: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFloatingActionButton(
                  icon: Icons.share,
                  onPressed: () {
                    // Implement share functionality
                  },
                ),
                const SizedBox(height: 8),
                _buildFloatingActionButton(
                  icon: Icons.favorite_border,
                  onPressed: () {
                    // Implement favorite functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomActions(property: widget.property),
    );
  }

  Widget _buildFloatingActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return FloatingActionButton(
      mini: true,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      child: Icon(icon),
    );
  }
}
