import 'package:flutter/material.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import '../../styles/detail_styles.dart';

class PropertyDescription extends StatefulWidget {
  final Property property;

  const PropertyDescription({
    super.key,
    required this.property,
  });

  @override
  State<PropertyDescription> createState() => _PropertyDescriptionState();
}

class _PropertyDescriptionState extends State<PropertyDescription> {
  bool _isExpanded = false;
  late final bool _needsExpansion;
  static const int _maxLines = 3;

  @override
  void initState() {
    super.initState();
    // Create a TextPainter to check if text needs expansion button
    final textSpan = TextSpan(
      text: widget.property.description,
      style: DetailStyles.descriptionStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: _maxLines,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 32);
    _needsExpansion = textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildDescriptionText(),
        if (_needsExpansion) _buildExpandButton(),
        _buildAmenities(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Description', style: DetailStyles.sectionTitleStyle),
          _buildPropertyStatus(),
        ],
      ),
    );
  }

  Widget _buildPropertyStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getStatusColor().withValues(alpha: 26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        widget.property.status.toUpperCase(),
        style: DetailStyles.statusStyle.copyWith(
          color: _getStatusColor(),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (widget.property.status.toLowerCase()) {
      case 'for sale':
        return Colors.blue;
      case 'for rent':
        return Colors.green;
      case 'sold':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Widget _buildDescriptionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        widget.property.description,
        style: DetailStyles.descriptionStyle,
        maxLines: _isExpanded ? null : _maxLines,
        overflow: _isExpanded ? null : TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildExpandButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _isExpanded ? 'Show Less' : 'Read More',
              style: DetailStyles.buttonStyle.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Icon(
              _isExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text('Amenities', style: DetailStyles.sectionTitleStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.property.amenities.map((amenity) {
              return _buildAmenityChip(amenity);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAmenityChip(String amenity) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getAmenityIcon(amenity),
            size: 16,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 4),
          Text(
            amenity,
            style: DetailStyles.amenityStyle,
          ),
        ],
      ),
    );
  }

  IconData _getAmenityIcon(String amenity) {
    switch (amenity.toLowerCase()) {
      case 'parking':
        return Icons.local_parking;
      case 'wifi':
        return Icons.wifi;
      case 'pool':
        return Icons.pool;
      case 'gym':
        return Icons.fitness_center;
      case 'security':
        return Icons.security;
      case 'air conditioning':
        return Icons.ac_unit;
      case 'heating':
        return Icons.hot_tub;
      case 'laundry':
        return Icons.local_laundry_service;
      case 'elevator':
        return Icons.elevator;
      case 'garden':
        return Icons.park;
      default:
        return Icons.check_circle_outline;
    }
  }
}
