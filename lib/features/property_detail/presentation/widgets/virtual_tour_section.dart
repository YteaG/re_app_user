import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import '../../styles/detail_styles.dart';

class VirtualTourSection extends StatefulWidget {
  final Property property;

  const VirtualTourSection({super.key, required this.property});

  @override
  State<VirtualTourSection> createState() => _VirtualTourSectionState();
}

class _VirtualTourSectionState extends State<VirtualTourSection> {
  bool _isVirtualTourVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Virtual Tour', style: DetailStyles.sectionTitleStyle),
        ),
        if (_isVirtualTourVisible)
          SizedBox(
            height: 300,
            child: ModelViewer(
              src: widget.property.virtualTourUrl!,
              alt: 'Virtual Tour',
              ar: true,
              autoRotate: true,
              cameraControls: true,
            ),
          )
        else
          Center(
            child: ElevatedButton.icon(
              onPressed: () => setState(() => _isVirtualTourVisible = true),
              icon: const Icon(Icons.view_in_ar),
              label: const Text('Start Virtual Tour'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
