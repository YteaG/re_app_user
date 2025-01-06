import 'package:flutter/material.dart';

class PropertyAppBar extends StatelessWidget {
  final bool showTitle;
  final String title;

  const PropertyAppBar({
    super.key,
    this.showTitle = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 0,
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: showTitle ? 2 : 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: AnimatedOpacity(
        opacity: showTitle ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share, color: Colors.black),
          onPressed: () {
            // Implement share functionality
          },
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.black),
          onPressed: () {
            // Implement favorite functionality
          },
        ),
      ],
    );
  }
}
