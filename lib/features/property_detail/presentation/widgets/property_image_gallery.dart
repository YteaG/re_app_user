import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';

class PropertyImageGallery extends StatefulWidget {
  final Property property;

  const PropertyImageGallery({
    super.key,
    required this.property,
  });

  @override
  State<PropertyImageGallery> createState() => _PropertyImageGalleryState();
}

class _PropertyImageGalleryState extends State<PropertyImageGallery> {
  int _currentImageIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImageCarousel(),
        _buildImageIndicator(),
        _buildNavigationButtons(),
      ],
    );
  }

  Widget _buildImageCarousel() {
    return CarouselSlider.builder(
      carouselController: _carouselController,
      itemCount: widget.property.images.length,
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          setState(() => _currentImageIndex = index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return _buildImageItem(widget.property.images[index]);
      },
    );
  }

  Widget _buildImageItem(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey[200],
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[200],
        child: const Icon(Icons.error),
      ),
    );
  }

  Widget _buildImageIndicator() {
    return Positioned(
      bottom: 16,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.property.images.asMap().entries.map((entry) {
          return Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(
                alpha: _currentImageIndex == entry.key ? 230 : 102,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Positioned.fill(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavigationButton(
            Icons.arrow_back_ios_new,
            () => _carouselController.previousPage(),
          ),
          _buildNavigationButton(
            Icons.arrow_forward_ios,
            () => _carouselController.nextPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(IconData icon, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 77),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
